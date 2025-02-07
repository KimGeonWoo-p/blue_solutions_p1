using System.Data;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using System.Collections.ObjectModel;
using OfficeOpenXml;
using CommunityToolkit.Maui.Storage;
using System.IO;

namespace maui_project;

public partial class MainPage : ContentPage
{
    public ObservableCollection<Entity> Entities { get; set; }
    public DataTable datatable;

    public MainPage()
    {
        // 데이터 테이블 생성
        datatable = new DataTable("result");
        datatable.Columns.Add("not_name", typeof(string));
        datatable.Columns.Add("search_keyword", typeof(string));
        datatable.Columns.Add("not_org", typeof(string));
        datatable.Columns.Add("need_org", typeof(string));
        datatable.Columns.Add("not_date", typeof(string));
        datatable.Columns.Add("search_date", typeof(string));
        InitializeComponent();
    }


    private async void OnOpenBrowserClicked(object sender, EventArgs e)
    {
        // 로딩창.
        LoadingPanel.IsVisible = true;

        string start_date = startdatePicker.Date.ToString("yyyyMMdd");
        string end_date = enddatePicker.Date.ToString("yyyyMMdd");
        string query = Keyword.Text;

        StatusLabel.Text = "Status: Launching browser...";
        StatusLabel.TextColor = Colors.Gray;

        string url = "https://www.g2b.go.kr/";
        DateTime today = DateTime.Now;

        // Launch Selenium with ChromeDriver
        ChromeOptions options = new ChromeOptions();
        options.AddArgument("--disable-gpu"); // GPU 사용 비활성화
        options.AddArgument("--no-sandbox"); // 샌드박스 모드 해제
        options.AddArgument("--headless"); // 브라우저 창을 시각화하지 않음

        ChromeDriverService service = ChromeDriverService.CreateDefaultService();
        service.HideCommandPromptWindow = true; // ChromeDriver 실행 시 콘솔 창 숨기기
        service.SuppressInitialDiagnosticInformation = true; // 초기 로깅 정보 숨기기

        try
        {
            using (IWebDriver driver = new ChromeDriver(service, options))
            {
                driver.Navigate().GoToUrl(url);
                await Task.Delay(3000); // Wait for 3 seconds

                // 입찰 공고 검색창으로 이동
                var RowElement = driver.FindElement(By.CssSelector("#mf_wfm_gnb_wfm_gnbMenu_genDepth1"));
                var elements = RowElement.FindElements(By.CssSelector("[class*='depth1-wrap']"));
                elements[1].Click();
                await Task.Delay(1000);

                IWebElement TmpElement = driver.FindElement(By.CssSelector("#mf_wfm_gnb_wfm_gnbMenu_genDepth1_1_genDepth2"));
                TmpElement = TmpElement.FindElement(By.CssSelector("[class*='depth2-wrap']"));
                TmpElement = TmpElement.FindElement(By.CssSelector("[class*='inner']"));
                TmpElement = TmpElement.FindElement(By.CssSelector("[class*='depth3-wrap']"));
                TmpElement.Click();
                await Task.Delay(1000);

                // 검색어 입력
                TmpElement = driver.FindElement(By.CssSelector("#mf_wfm_container_tacBidPbancLst_contents_tab2_body_bidPbancNm"));
                if (query != null)
                    TmpElement.SendKeys(query);

                // 기간 지정
                TmpElement = driver.FindElement(By.CssSelector("#mf_wfm_container_tacBidPbancLst_contents_tab2_body_grpShbox"));
                TmpElement = TmpElement.FindElement(By.CssSelector("[id*='ibxStrDay']"));
                TmpElement.Clear();
                TmpElement.SendKeys(start_date);

                TmpElement = driver.FindElement(By.CssSelector("#mf_wfm_container_tacBidPbancLst_contents_tab2_body_grpShbox"));
                TmpElement = TmpElement.FindElement(By.CssSelector("[id*='ibxEndDay']"));
                TmpElement.Clear();
                TmpElement.SendKeys(end_date);

                // 검색 실행
                TmpElement = driver.FindElement(By.CssSelector("#mf_wfm_container_tacBidPbancLst_contents_tab2_body_btnS0004"));
                TmpElement.Click();

                await Task.Delay(3000);

                TmpElement = driver.FindElement(By.CssSelector("#mf_wfm_container_tacBidPbancLst_contents_tab2_body_gridView1_body_tbody"));
                IList<IWebElement> trElements = TmpElement.FindElements(By.XPath("//*[contains(@class, 'grid_body_row') and not(@hidden)]"));
                trElements = trElements.Where(e => e.Displayed).ToList();

                foreach (var element in trElements)
                {
                    IList<IWebElement> row = element.FindElements(By.TagName("td"));
                    List<String> list = new List<String>();

                    foreach (var el in row)
                        list.Add(el.Text);

                    string not_name = list[6];
                    string search_keyword = query;
                    string not_org = list[7];
                    string need_org = list[8];
                    string not_date = list[9];
                    string search_date = today.ToString("yyyy/MM/dd");

                    datatable.Rows.Add(not_name, search_keyword, not_org, need_org, not_date, search_date);
                }

                Entities = new ObservableCollection<Entity>();

                // 결과를 표시
                int cnt = 0;
                foreach (DataRow row in datatable.Rows)
                {
                    Entities.Add(new Entity
                    {
                        not_name = row[0].ToString(),
                        search_keyword = row[1].ToString(),
                        not_org = row[2].ToString(),
                        need_org = row[3].ToString(),
                        not_date = row[4].ToString(),
                        search_date = row[5].ToString()
                    });
                    cnt++;
                }

                // ListView에 데이터 바인딩
                dataListView.ItemsSource = Entities;

                // 상태 표시
                StatusLabel.Text = $"Status: Successfully opened.\n" 
                    + cnt + "개의 결과";
                StatusLabel.TextColor = Colors.Green;

                // 다운로드버튼 활성화
                DownloadLayer.IsVisible = true;

                // 차트 활성화
                Chart.IsVisible = true;
            }
        }
        catch (Exception ex)
        {
            StatusLabel.Text = $"Status: Open failed.";
            StatusLabel.TextColor = Colors.Red;
            return;
        }
        finally
        {
            // 로딩창.
            LoadingPanel.IsVisible = false;
        }
    }

    private async void OnDownloadClicked(object sender, EventArgs e)
    {
        var stream = new MemoryStream(); // 메모리 스트림 생성

        try
        {
            // EPPlus 라이브러리에서 ExcelPackage 사용
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial; // 비상업적 사용 선언
            
            using (var package = new ExcelPackage(stream))
            {
                // 워크시트 추가
                var worksheet = package.Workbook.Worksheets.Add("Sheet1");

                // 헤더 추가
                for (int col = 0; col < datatable.Columns.Count; col++)
                {
                    worksheet.Cells[1, col + 1].Value = datatable.Columns[col].ColumnName;
                }

                // 데이터 추가
                for (int row = 0; row < datatable.Rows.Count; row++)
                {
                    for (int col = 0; col < datatable.Columns.Count; col++)
                    {
                        worksheet.Cells[row + 2, col + 1].Value = datatable.Rows[row][col];
                    }
                }

                package.Save(); // 스트림에 데이터 저장
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("다운로드 실패", "다운로드에 실패하였습니다.", "OK");
            return;
        }

        stream.Position = 0;

        // 파일 저장
        using var cts = new CancellationTokenSource(); // CancellationTokenSource 생성
        CancellationToken cancellationToken = cts.Token;

        var fileSaveResult = await FileSaver.Default.SaveAsync("장표.xlsx", stream, cancellationToken);

        if (fileSaveResult.IsSuccessful)
        {
            await DisplayAlert("파일 저장", $"파일이 저장됨: {fileSaveResult.FilePath}", "확인");
        }
        else
        {
            await DisplayAlert("다운로드 실패", "다운로드에 실패하였습니다.", "OK");
        }
    }

    private async void OnResetClicked(object sender, EventArgs e)
    {
        datatable.Clear();
        dataListView.ItemsSource = null;
        DownloadLayer.IsVisible = false;
        Chart.IsVisible = false;

        StatusLabel.Text = "Status: Waiting...";
        StatusLabel.TextColor = Colors.Gray;
    }

    public class Entity
    {
        public string not_name { get; set; }
        public string search_keyword { get; set; }
        public string not_org { get; set; }
        public string need_org { get; set; }
        public string not_date { get; set; }
        public string search_date { get; set; }
    }
}
