using System;
using System.Data;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using System.Windows;
using System.Collections.ObjectModel;
using OfficeOpenXml;

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
        string url = "https://www.g2b.go.kr/";
        string query = Keyword.Text;
        DateTime today = DateTime.Now;
        int target_duration = Convert.ToInt32(Duration.Text);

        if (string.IsNullOrWhiteSpace(query))
        {
            StatusLabel.Text = "Status: Please enter a valid key word.";
            StatusLabel.TextColor = Colors.Red;
            return;
        }

        try
        {
            StatusLabel.Text = "Status: Launching browser...";
            StatusLabel.TextColor = Colors.Gray;

            // Launch Selenium with ChromeDriver
            ChromeOptions options = new ChromeOptions();
            options.AddArgument("--disable-gpu"); // GPU 사용 비활성화
            options.AddArgument("--no-sandbox"); // 샌드박스 모드 해제
            options.AddArgument("--headless"); // 브라우저 창을 시각화하지 않음

            using (IWebDriver driver = new ChromeDriver(options))
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
                TmpElement.SendKeys(query);

                // 기간 지정
                TmpElement = driver.FindElement(By.CssSelector("#mf_wfm_container_tacBidPbancLst_contents_tab2_body_grpShbox"));
                string start_date = DateTime.Today.AddDays(-target_duration).ToString("yyyyMMdd");
                TmpElement = TmpElement.FindElement(By.CssSelector("[id*='ibxStrDay']"));
                TmpElement.Clear();
                TmpElement.SendKeys(start_date);
                
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
                    string search_date = today.ToString("yyyy/mm/dd");

                    datatable.Rows.Add(not_name, search_keyword, not_org, need_org, not_date, search_date);
                }

                Entities = new ObservableCollection<Entity>();
                // 결과를 표시
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
                }

                // ListView에 데이터 바인딩
                dataListView.ItemsSource = Entities;

                // 다운로드 버튼 시각화
                Download.IsVisible = true;

                // 크롬드라이버 종료
                driver.Quit();
            }

            StatusLabel.Text = $"Status: Successfully opened {url}.";
            StatusLabel.TextColor = Colors.Green;
        }
        catch (Exception ex)
        {
            StatusLabel.Text = $"Status: Error - {ex.Message}";
            StatusLabel.TextColor = Colors.Red;
        }
        
    }

    private async void OnDownloadClicked(object sender, EventArgs e)
    {
        try
        {
            // EPPlus 라이브러리에서 ExcelPackage 사용
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial; // 비상업적 사용 선언
            using (var package = new ExcelPackage())
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

                string filePath = Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\장표.xlsx";

                // 파일 저장
                File.WriteAllBytes(filePath, package.GetAsByteArray());

                await Application.Current.MainPage.DisplayAlert("다운로드 성공", "다운로드에 성공하였습니다.", "OK");
            }
        }
        catch (Exception ex)
        {
            await Application.Current.MainPage.DisplayAlert("다운로드 실패", "다운로드에 실패하였습니다.", "OK");
        }
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
