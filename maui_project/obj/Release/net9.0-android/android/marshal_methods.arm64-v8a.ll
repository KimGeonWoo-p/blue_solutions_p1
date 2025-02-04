; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [159 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [477 x i64] [
	i64 u0x0071cf2d27b7d61e, ; 0: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 84
	i64 u0x01109b0e4d99e61f, ; 1: System.ComponentModel.Annotations.dll => 97
	i64 u0x02123411c4e01926, ; 2: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 80
	i64 u0x02827b47e97f2378, ; 3: System.Security.Cryptography.Pkcs.dll => 61
	i64 u0x02abedc11addc1ed, ; 4: lib_Mono.Android.Runtime.dll.so => 157
	i64 u0x032267b2a94db371, ; 5: lib_Xamarin.AndroidX.AppCompat.dll.so => 63
	i64 u0x033a1d0324ba06bd, ; 6: Microsoft.IO.RecyclableMemoryStream.dll => 51
	i64 u0x043032f1d071fae0, ; 7: ru/Microsoft.Maui.Controls.resources => 24
	i64 u0x044440a55165631e, ; 8: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 2
	i64 u0x046eb1581a80c6b0, ; 9: vi/Microsoft.Maui.Controls.resources => 30
	i64 u0x0517ef04e06e9f76, ; 10: System.Net.Primitives => 122
	i64 u0x0565d18c6da3de38, ; 11: Xamarin.AndroidX.RecyclerView => 82
	i64 u0x0581db89237110e9, ; 12: lib_System.Collections.dll.so => 96
	i64 u0x05989cb940b225a9, ; 13: Microsoft.Maui.dll => 54
	i64 u0x06076b5d2b581f08, ; 14: zh-HK/Microsoft.Maui.Controls.resources => 31
	i64 u0x0680a433c781bb3d, ; 15: Xamarin.AndroidX.Collection.Jvm => 66
	i64 u0x07c57877c7ba78ad, ; 16: ru/Microsoft.Maui.Controls.resources.dll => 24
	i64 u0x07dcdc7460a0c5e4, ; 17: System.Collections.NonGeneric => 94
	i64 u0x08f3c9788ee2153c, ; 18: Xamarin.AndroidX.DrawerLayout => 71
	i64 u0x09138715c92dba90, ; 19: lib_System.ComponentModel.Annotations.dll.so => 97
	i64 u0x0919c28b89381a0b, ; 20: lib_Microsoft.Extensions.Options.dll.so => 49
	i64 u0x092266563089ae3e, ; 21: lib_System.Collections.NonGeneric.dll.so => 94
	i64 u0x09d144a7e214d457, ; 22: System.Security.Cryptography => 140
	i64 u0x0abb3e2b271edc45, ; 23: System.Threading.Channels.dll => 147
	i64 u0x0b3b632c3bbee20c, ; 24: sk/Microsoft.Maui.Controls.resources => 25
	i64 u0x0b6aff547b84fbe9, ; 25: Xamarin.KotlinX.Serialization.Core.Jvm => 90
	i64 u0x0be2e1f8ce4064ed, ; 26: Xamarin.AndroidX.ViewPager => 85
	i64 u0x0c3ca6cc978e2aae, ; 27: pt-BR/Microsoft.Maui.Controls.resources => 21
	i64 u0x0c59ad9fbbd43abe, ; 28: Mono.Android => 158
	i64 u0x0c7790f60165fc06, ; 29: lib_Microsoft.Maui.Essentials.dll.so => 55
	i64 u0x0e14e73a54dda68e, ; 30: lib_System.Net.NameResolution.dll.so => 120
	i64 u0x102a31b45304b1da, ; 31: Xamarin.AndroidX.CustomView => 70
	i64 u0x10f6cfcbcf801616, ; 32: System.IO.Compression.Brotli => 110
	i64 u0x11a70d0e1009fb11, ; 33: System.Net.WebSockets.dll => 128
	i64 u0x125b7f94acb989db, ; 34: Xamarin.AndroidX.RecyclerView.dll => 82
	i64 u0x137b34d6751da129, ; 35: System.Drawing.Common => 60
	i64 u0x13a01de0cbc3f06c, ; 36: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 8
	i64 u0x13f1e5e209e91af4, ; 37: lib_Java.Interop.dll.so => 156
	i64 u0x13f1e880c25d96d1, ; 38: he/Microsoft.Maui.Controls.resources => 9
	i64 u0x143d8ea60a6a4011, ; 39: Microsoft.Extensions.DependencyInjection.Abstractions => 43
	i64 u0x1497051b917530bd, ; 40: lib_System.Net.WebSockets.dll.so => 128
	i64 u0x152a448bd1e745a7, ; 41: Microsoft.Win32.Primitives => 92
	i64 u0x16bf2a22df043a09, ; 42: System.IO.Pipes.dll => 115
	i64 u0x17125c9a85b4929f, ; 43: lib_netstandard.dll.so => 154
	i64 u0x17b56e25558a5d36, ; 44: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 12
	i64 u0x17f9358913beb16a, ; 45: System.Text.Encodings.Web => 144
	i64 u0x18402a709e357f3b, ; 46: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 90
	i64 u0x184e267d06b0b855, ; 47: EPPlus.System.Drawing.dll => 37
	i64 u0x18f0ce884e87d89a, ; 48: nb/Microsoft.Maui.Controls.resources.dll => 18
	i64 u0x19a4c090f14ebb66, ; 49: System.Security.Claims => 139
	i64 u0x1a91866a319e9259, ; 50: lib_System.Collections.Concurrent.dll.so => 93
	i64 u0x1aac34d1917ba5d3, ; 51: lib_System.dll.so => 153
	i64 u0x1aad60783ffa3e5b, ; 52: lib-th-Microsoft.Maui.Controls.resources.dll.so => 27
	i64 u0x1c5217a9e4973753, ; 53: lib_Microsoft.Extensions.FileProviders.Physical.dll.so => 45
	i64 u0x1c753b5ff15bce1b, ; 54: Mono.Android.Runtime.dll => 157
	i64 u0x1e3d87657e9659bc, ; 55: Xamarin.AndroidX.Navigation.UI => 81
	i64 u0x1e71143913d56c10, ; 56: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 16
	i64 u0x1ed8fcce5e9b50a0, ; 57: Microsoft.Extensions.Options.dll => 49
	i64 u0x209375905fcc1bad, ; 58: lib_System.IO.Compression.Brotli.dll.so => 110
	i64 u0x20fab3cf2dfbc8df, ; 59: lib_System.Diagnostics.Process.dll.so => 104
	i64 u0x212dabedfbeb018b, ; 60: lib_EPPlus.dll.so => 35
	i64 u0x2174319c0d835bc9, ; 61: System.Runtime => 138
	i64 u0x219ea1b751a4dee4, ; 62: lib_System.IO.Compression.ZipFile.dll.so => 111
	i64 u0x220fd4f2e7c48170, ; 63: th/Microsoft.Maui.Controls.resources => 27
	i64 u0x224538d85ed15a82, ; 64: System.IO.Pipes => 115
	i64 u0x237be844f1f812c7, ; 65: System.Threading.Thread.dll => 148
	i64 u0x2407aef2bbe8fadf, ; 66: System.Console => 101
	i64 u0x240abe014b27e7d3, ; 67: Xamarin.AndroidX.Core.dll => 68
	i64 u0x247619fe4413f8bf, ; 68: System.Runtime.Serialization.Primitives.dll => 137
	i64 u0x252073cc3caa62c2, ; 69: fr/Microsoft.Maui.Controls.resources.dll => 8
	i64 u0x25ad0df7524b370b, ; 70: WebDriver => 59
	i64 u0x2662c629b96b0b30, ; 71: lib_Xamarin.Kotlin.StdLib.dll.so => 88
	i64 u0x268c1439f13bcc29, ; 72: lib_Microsoft.Extensions.Primitives.dll.so => 50
	i64 u0x273f3515de5faf0d, ; 73: id/Microsoft.Maui.Controls.resources.dll => 13
	i64 u0x2742545f9094896d, ; 74: hr/Microsoft.Maui.Controls.resources => 11
	i64 u0x2759af78ab94d39b, ; 75: System.Net.WebSockets => 128
	i64 u0x27b410442fad6cf1, ; 76: Java.Interop.dll => 156
	i64 u0x2801845a2c71fbfb, ; 77: System.Net.Primitives.dll => 122
	i64 u0x2a128783efe70ba0, ; 78: uk/Microsoft.Maui.Controls.resources.dll => 29
	i64 u0x2a3b095612184159, ; 79: lib_System.Net.NetworkInformation.dll.so => 121
	i64 u0x2a6507a5ffabdf28, ; 80: System.Diagnostics.TraceSource.dll => 105
	i64 u0x2ad156c8e1354139, ; 81: fi/Microsoft.Maui.Controls.resources => 7
	i64 u0x2af298f63581d886, ; 82: System.Text.RegularExpressions.dll => 146
	i64 u0x2afc1c4f898552ee, ; 83: lib_System.Formats.Asn1.dll.so => 109
	i64 u0x2b148910ed40fbf9, ; 84: zh-Hant/Microsoft.Maui.Controls.resources.dll => 33
	i64 u0x2b4d4904cebfa4e9, ; 85: Microsoft.Extensions.FileSystemGlobbing => 46
	i64 u0x2b73dc6bb40edd58, ; 86: EPPlus.Interfaces.dll => 36
	i64 u0x2c8bd14bb93a7d82, ; 87: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 20
	i64 u0x2cbd9262ca785540, ; 88: lib_System.Text.Encoding.CodePages.dll.so => 142
	i64 u0x2d169d318a968379, ; 89: System.Threading.dll => 150
	i64 u0x2d47774b7d993f59, ; 90: sv/Microsoft.Maui.Controls.resources.dll => 26
	i64 u0x2db915caf23548d2, ; 91: System.Text.Json.dll => 145
	i64 u0x2e6f1f226821322a, ; 92: el/Microsoft.Maui.Controls.resources.dll => 5
	i64 u0x2f02f94df3200fe5, ; 93: System.Diagnostics.Process => 104
	i64 u0x2f2e98e1c89b1aff, ; 94: System.Xml.ReaderWriter => 152
	i64 u0x2f5911d9ba814e4e, ; 95: System.Diagnostics.Tracing => 106
	i64 u0x309ee9eeec09a71e, ; 96: lib_Xamarin.AndroidX.Fragment.dll.so => 72
	i64 u0x31195fef5d8fb552, ; 97: _Microsoft.Android.Resource.Designer.dll => 34
	i64 u0x32243413e774362a, ; 98: Xamarin.AndroidX.CardView.dll => 65
	i64 u0x3235427f8d12dae1, ; 99: lib_System.Drawing.Primitives.dll.so => 107
	i64 u0x329753a17a517811, ; 100: fr/Microsoft.Maui.Controls.resources => 8
	i64 u0x32aa989ff07a84ff, ; 101: lib_System.Xml.ReaderWriter.dll.so => 152
	i64 u0x33642d5508314e46, ; 102: Microsoft.Extensions.FileSystemGlobbing.dll => 46
	i64 u0x33a31443733849fe, ; 103: lib-es-Microsoft.Maui.Controls.resources.dll.so => 6
	i64 u0x341abc357fbb4ebf, ; 104: lib_System.Net.Sockets.dll.so => 125
	i64 u0x34dfd74fe2afcf37, ; 105: Microsoft.Maui => 54
	i64 u0x34e292762d9615df, ; 106: cs/Microsoft.Maui.Controls.resources.dll => 2
	i64 u0x3508234247f48404, ; 107: Microsoft.Maui.Controls => 52
	i64 u0x353590da528c9d22, ; 108: System.ComponentModel.Annotations => 97
	i64 u0x3549870798b4cd30, ; 109: lib_Xamarin.AndroidX.ViewPager2.dll.so => 86
	i64 u0x355282fc1c909694, ; 110: Microsoft.Extensions.Configuration => 38
	i64 u0x385c17636bb6fe6e, ; 111: Xamarin.AndroidX.CustomView.dll => 70
	i64 u0x38869c811d74050e, ; 112: System.Net.NameResolution.dll => 120
	i64 u0x393c226616977fdb, ; 113: lib_Xamarin.AndroidX.ViewPager.dll.so => 85
	i64 u0x395e37c3334cf82a, ; 114: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 1
	i64 u0x39c3107c28752af1, ; 115: lib_Microsoft.Extensions.FileProviders.Abstractions.dll.so => 44
	i64 u0x3b860f9932505633, ; 116: lib_System.Text.Encoding.Extensions.dll.so => 143
	i64 u0x3c7c495f58ac5ee9, ; 117: Xamarin.Kotlin.StdLib => 88
	i64 u0x3ce26a4eae3338b5, ; 118: lib_WebDriver.Support.dll.so => 58
	i64 u0x3d2b1913edfc08d7, ; 119: lib_System.Threading.ThreadPool.dll.so => 149
	i64 u0x3d9c2a242b040a50, ; 120: lib_Xamarin.AndroidX.Core.dll.so => 68
	i64 u0x3db495de2204755c, ; 121: Microsoft.Extensions.Configuration.FileExtensions => 40
	i64 u0x407a10bb4bf95829, ; 122: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 78
	i64 u0x41cab042be111c34, ; 123: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 64
	i64 u0x43375950ec7c1b6a, ; 124: netstandard.dll => 154
	i64 u0x434c4e1d9284cdae, ; 125: Mono.Android.dll => 158
	i64 u0x43950f84de7cc79a, ; 126: pl/Microsoft.Maui.Controls.resources.dll => 20
	i64 u0x4499fa3c8e494654, ; 127: lib_System.Runtime.Serialization.Primitives.dll.so => 137
	i64 u0x4515080865a951a5, ; 128: Xamarin.Kotlin.StdLib.dll => 88
	i64 u0x45c40276a42e283e, ; 129: System.Diagnostics.TraceSource => 105
	i64 u0x46a4213bc97fe5ae, ; 130: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 24
	i64 u0x47daf4e1afbada10, ; 131: pt/Microsoft.Maui.Controls.resources => 22
	i64 u0x49e952f19a4e2022, ; 132: System.ObjectModel => 130
	i64 u0x4a5667b2462a664b, ; 133: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 81
	i64 u0x4b7b6532ded934b7, ; 134: System.Text.Json => 145
	i64 u0x4cc5f15266470798, ; 135: lib_Xamarin.AndroidX.Loader.dll.so => 77
	i64 u0x4cf6f67dc77aacd2, ; 136: System.Net.NetworkInformation.dll => 121
	i64 u0x4d3183dd245425d4, ; 137: System.Net.WebSockets.Client.dll => 127
	i64 u0x4d479f968a05e504, ; 138: System.Linq.Expressions.dll => 116
	i64 u0x4d55a010ffc4faff, ; 139: System.Private.Xml => 132
	i64 u0x4d95fccc1f67c7ca, ; 140: System.Runtime.Loader.dll => 134
	i64 u0x4dc70de9e8eb77a6, ; 141: WebDriver.Support.dll => 58
	i64 u0x4dcf44c3c9b076a2, ; 142: it/Microsoft.Maui.Controls.resources.dll => 14
	i64 u0x4dd9247f1d2c3235, ; 143: Xamarin.AndroidX.Loader.dll => 77
	i64 u0x4e32f00cb0937401, ; 144: Mono.Android.Runtime => 157
	i64 u0x4e5eea4668ac2b18, ; 145: System.Text.Encoding.CodePages => 142
	i64 u0x4ebd0c4b82c5eefc, ; 146: lib_System.Threading.Channels.dll.so => 147
	i64 u0x4f21ee6ef9eb527e, ; 147: ca/Microsoft.Maui.Controls.resources => 1
	i64 u0x5037f0be3c28c7a3, ; 148: lib_Microsoft.Maui.Controls.dll.so => 52
	i64 u0x5131bbe80989093f, ; 149: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 75
	i64 u0x51bb8a2afe774e32, ; 150: System.Drawing => 108
	i64 u0x526ce79eb8e90527, ; 151: lib_System.Net.Primitives.dll.so => 122
	i64 u0x52829f00b4467c38, ; 152: lib_System.Data.Common.dll.so => 102
	i64 u0x529ffe06f39ab8db, ; 153: Xamarin.AndroidX.Core => 68
	i64 u0x52ff996554dbf352, ; 154: Microsoft.Maui.Graphics => 56
	i64 u0x535f7e40e8fef8af, ; 155: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 25
	i64 u0x53a96d5c86c9e194, ; 156: System.Net.NetworkInformation => 121
	i64 u0x53c3014b9437e684, ; 157: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 31
	i64 u0x5435e6f049e9bc37, ; 158: System.Security.Claims.dll => 139
	i64 u0x54795225dd1587af, ; 159: lib_System.Runtime.dll.so => 138
	i64 u0x556e8b63b660ab8b, ; 160: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 73
	i64 u0x5588627c9a108ec9, ; 161: System.Collections.Specialized => 95
	i64 u0x5589194acf5cc5a8, ; 162: WebDriver.Support => 58
	i64 u0x571c5cfbec5ae8e2, ; 163: System.Private.Uri => 131
	i64 u0x579a06fed6eec900, ; 164: System.Private.CoreLib.dll => 155
	i64 u0x57c542c14049b66d, ; 165: System.Diagnostics.DiagnosticSource => 103
	i64 u0x58601b2dda4a27b9, ; 166: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 15
	i64 u0x58688d9af496b168, ; 167: Microsoft.Extensions.DependencyInjection.dll => 42
	i64 u0x5a89a886ae30258d, ; 168: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 67
	i64 u0x5a8f6699f4a1caa9, ; 169: lib_System.Threading.dll.so => 150
	i64 u0x5ae9cd33b15841bf, ; 170: System.ComponentModel => 100
	i64 u0x5b5f0e240a06a2a2, ; 171: da/Microsoft.Maui.Controls.resources.dll => 3
	i64 u0x5c1deddd1ec4acea, ; 172: lib_maui_project.dll.so => 91
	i64 u0x5c393624b8176517, ; 173: lib_Microsoft.Extensions.Logging.dll.so => 47
	i64 u0x5d0a4a29b02d9d3c, ; 174: System.Net.WebHeaderCollection.dll => 126
	i64 u0x5db0cbbd1028510e, ; 175: lib_System.Runtime.InteropServices.dll.so => 133
	i64 u0x5db30905d3e5013b, ; 176: Xamarin.AndroidX.Collection.Jvm.dll => 66
	i64 u0x5e467bc8f09ad026, ; 177: System.Collections.Specialized.dll => 95
	i64 u0x5ea92fdb19ec8c4c, ; 178: System.Text.Encodings.Web.dll => 144
	i64 u0x5eb8046dd40e9ac3, ; 179: System.ComponentModel.Primitives => 98
	i64 u0x5f36ccf5c6a57e24, ; 180: System.Xml.ReaderWriter.dll => 152
	i64 u0x5f4294b9b63cb842, ; 181: System.Data.Common => 102
	i64 u0x5f9a2d823f664957, ; 182: lib-el-Microsoft.Maui.Controls.resources.dll.so => 5
	i64 u0x609f4b7b63d802d4, ; 183: lib_Microsoft.Extensions.DependencyInjection.dll.so => 42
	i64 u0x60cd4e33d7e60134, ; 184: Xamarin.KotlinX.Coroutines.Core.Jvm => 89
	i64 u0x60f62d786afcf130, ; 185: System.Memory => 118
	i64 u0x61be8d1299194243, ; 186: Microsoft.Maui.Controls.Xaml => 53
	i64 u0x61d2cba29557038f, ; 187: de/Microsoft.Maui.Controls.resources => 4
	i64 u0x61d88f399afb2f45, ; 188: lib_System.Runtime.Loader.dll.so => 134
	i64 u0x622eef6f9e59068d, ; 189: System.Private.CoreLib => 155
	i64 u0x633f3b7a6c6b8e0d, ; 190: maui_project => 91
	i64 u0x6400f68068c1e9f1, ; 191: Xamarin.Google.Android.Material.dll => 87
	i64 u0x65ecac39144dd3cc, ; 192: Microsoft.Maui.Controls.dll => 52
	i64 u0x65ece51227bfa724, ; 193: lib_System.Runtime.Numerics.dll.so => 135
	i64 u0x6668e5c50e448662, ; 194: EPPlus => 35
	i64 u0x6692e924eade1b29, ; 195: lib_System.Console.dll.so => 101
	i64 u0x66a4e5c6a3fb0bae, ; 196: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 75
	i64 u0x66ad21286ac74b9d, ; 197: lib_System.Drawing.Common.dll.so => 60
	i64 u0x66d13304ce1a3efa, ; 198: Xamarin.AndroidX.CursorAdapter => 69
	i64 u0x68558ec653afa616, ; 199: lib-da-Microsoft.Maui.Controls.resources.dll.so => 3
	i64 u0x6872ec7a2e36b1ac, ; 200: System.Drawing.Primitives.dll => 107
	i64 u0x68fbbbe2eb455198, ; 201: System.Formats.Asn1 => 109
	i64 u0x69063fc0ba8e6bdd, ; 202: he/Microsoft.Maui.Controls.resources.dll => 9
	i64 u0x6a4d7577b2317255, ; 203: System.Runtime.InteropServices.dll => 133
	i64 u0x6ace3b74b15ee4a4, ; 204: nb/Microsoft.Maui.Controls.resources => 18
	i64 u0x6d12bfaa99c72b1f, ; 205: lib_Microsoft.Maui.Graphics.dll.so => 56
	i64 u0x6d79993361e10ef2, ; 206: Microsoft.Extensions.Primitives => 50
	i64 u0x6d86d56b84c8eb71, ; 207: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 69
	i64 u0x6d9bea6b3e895cf7, ; 208: Microsoft.Extensions.Primitives.dll => 50
	i64 u0x6e25a02c3833319a, ; 209: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 79
	i64 u0x6fd2265da78b93a4, ; 210: lib_Microsoft.Maui.dll.so => 54
	i64 u0x6fdfc7de82c33008, ; 211: cs/Microsoft.Maui.Controls.resources => 2
	i64 u0x6ffc4967cc47ba57, ; 212: System.IO.FileSystem.Watcher.dll => 113
	i64 u0x70e99f48c05cb921, ; 213: tr/Microsoft.Maui.Controls.resources.dll => 28
	i64 u0x70fd3deda22442d2, ; 214: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 18
	i64 u0x71a495ea3761dde8, ; 215: lib-it-Microsoft.Maui.Controls.resources.dll.so => 14
	i64 u0x71ad672adbe48f35, ; 216: System.ComponentModel.Primitives.dll => 98
	i64 u0x71bc142d620e986a, ; 217: lib_System.Security.Cryptography.Pkcs.dll.so => 61
	i64 u0x72b1fb4109e08d7b, ; 218: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 11
	i64 u0x730bfb248998f67a, ; 219: System.IO.Compression.ZipFile => 111
	i64 u0x73e4ce94e2eb6ffc, ; 220: lib_System.Memory.dll.so => 118
	i64 u0x755a91767330b3d4, ; 221: lib_Microsoft.Extensions.Configuration.dll.so => 38
	i64 u0x76012e7334db86e5, ; 222: lib_Xamarin.AndroidX.SavedState.dll.so => 83
	i64 u0x76ca07b878f44da0, ; 223: System.Runtime.Numerics.dll => 135
	i64 u0x779f67ad3b8efbd5, ; 224: Microsoft.Extensions.Configuration.Json.dll => 41
	i64 u0x780bc73597a503a9, ; 225: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 17
	i64 u0x783606d1e53e7a1a, ; 226: th/Microsoft.Maui.Controls.resources.dll => 27
	i64 u0x78a45e51311409b6, ; 227: Xamarin.AndroidX.Fragment.dll => 72
	i64 u0x79f2a1023f4320f2, ; 228: Microsoft.Win32.SystemEvents => 57
	i64 u0x7adb8da2ac89b647, ; 229: fi/Microsoft.Maui.Controls.resources.dll => 7
	i64 u0x7bef86a4335c4870, ; 230: System.ComponentModel.TypeConverter => 99
	i64 u0x7c0820144cd34d6a, ; 231: sk/Microsoft.Maui.Controls.resources.dll => 25
	i64 u0x7c2a0bd1e0f988fc, ; 232: lib-de-Microsoft.Maui.Controls.resources.dll.so => 4
	i64 u0x7d649b75d580bb42, ; 233: ms/Microsoft.Maui.Controls.resources.dll => 17
	i64 u0x7d8ee2bdc8e3aad1, ; 234: System.Numerics.Vectors => 129
	i64 u0x7dfc3d6d9d8d7b70, ; 235: System.Collections => 96
	i64 u0x7e2e564fa2f76c65, ; 236: lib_System.Diagnostics.Tracing.dll.so => 106
	i64 u0x7e302e110e1e1346, ; 237: lib_System.Security.Claims.dll.so => 139
	i64 u0x7e946809d6008ef2, ; 238: lib_System.ObjectModel.dll.so => 130
	i64 u0x7ecc13347c8fd849, ; 239: lib_System.ComponentModel.dll.so => 100
	i64 u0x7f00ddd9b9ca5a13, ; 240: Xamarin.AndroidX.ViewPager.dll => 85
	i64 u0x7f9351cd44b1273f, ; 241: Microsoft.Extensions.Configuration.Abstractions => 39
	i64 u0x7fbd557c99b3ce6f, ; 242: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 74
	i64 u0x812c069d5cdecc17, ; 243: System.dll => 153
	i64 u0x81ab745f6c0f5ce6, ; 244: zh-Hant/Microsoft.Maui.Controls.resources => 33
	i64 u0x8277f2be6b5ce05f, ; 245: Xamarin.AndroidX.AppCompat => 63
	i64 u0x828f06563b30bc50, ; 246: lib_Xamarin.AndroidX.CardView.dll.so => 65
	i64 u0x82df8f5532a10c59, ; 247: lib_System.Drawing.dll.so => 108
	i64 u0x82f6403342e12049, ; 248: uk/Microsoft.Maui.Controls.resources => 29
	i64 u0x83c14ba66c8e2b8c, ; 249: zh-Hans/Microsoft.Maui.Controls.resources => 32
	i64 u0x8478602014b59199, ; 250: lib_EPPlus.System.Drawing.dll.so => 37
	i64 u0x84ae73148a4557d2, ; 251: lib_System.IO.Pipes.dll.so => 115
	i64 u0x86a909228dc7657b, ; 252: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 33
	i64 u0x86b3e00c36b84509, ; 253: Microsoft.Extensions.Configuration.dll => 38
	i64 u0x8704193f462e892e, ; 254: lib_Microsoft.Extensions.FileSystemGlobbing.dll.so => 46
	i64 u0x87c69b87d9283884, ; 255: lib_System.Threading.Thread.dll.so => 148
	i64 u0x87f6569b25707834, ; 256: System.IO.Compression.Brotli.dll => 110
	i64 u0x8842b3a5d2d3fb36, ; 257: Microsoft.Maui.Essentials => 55
	i64 u0x88bda98e0cffb7a9, ; 258: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 89
	i64 u0x8930322c7bd8f768, ; 259: netstandard => 154
	i64 u0x897a606c9e39c75f, ; 260: lib_System.ComponentModel.Primitives.dll.so => 98
	i64 u0x8ab57fd351a6dfc4, ; 261: maui_project.dll => 91
	i64 u0x8ad229ea26432ee2, ; 262: Xamarin.AndroidX.Loader => 77
	i64 u0x8b4ff5d0fdd5faa1, ; 263: lib_System.Diagnostics.DiagnosticSource.dll.so => 103
	i64 u0x8b541d476eb3774c, ; 264: System.Security.Principal.Windows => 141
	i64 u0x8b8d01333a96d0b5, ; 265: System.Diagnostics.Process.dll => 104
	i64 u0x8b9ceca7acae3451, ; 266: lib-he-Microsoft.Maui.Controls.resources.dll.so => 9
	i64 u0x8ba96f31f69ece34, ; 267: Microsoft.Win32.SystemEvents.dll => 57
	i64 u0x8c575135aa1ccef4, ; 268: Microsoft.Extensions.FileProviders.Abstractions => 44
	i64 u0x8cdfdb4ce85fb925, ; 269: lib_System.Security.Principal.Windows.dll.so => 141
	i64 u0x8d0f420977c2c1c7, ; 270: Xamarin.AndroidX.CursorAdapter.dll => 69
	i64 u0x8d7b8ab4b3310ead, ; 271: System.Threading => 150
	i64 u0x8da188285aadfe8e, ; 272: System.Collections.Concurrent => 93
	i64 u0x8ed807bfe9858dfc, ; 273: Xamarin.AndroidX.Navigation.Common => 78
	i64 u0x8ee08b8194a30f48, ; 274: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 10
	i64 u0x8ef7601039857a44, ; 275: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 23
	i64 u0x8f32c6f611f6ffab, ; 276: pt/Microsoft.Maui.Controls.resources.dll => 22
	i64 u0x8f8829d21c8985a4, ; 277: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 21
	i64 u0x90263f8448b8f572, ; 278: lib_System.Diagnostics.TraceSource.dll.so => 105
	i64 u0x903101b46fb73a04, ; 279: _Microsoft.Android.Resource.Designer => 34
	i64 u0x90393bd4865292f3, ; 280: lib_System.IO.Compression.dll.so => 112
	i64 u0x90634f86c5ebe2b5, ; 281: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 75
	i64 u0x907b636704ad79ef, ; 282: lib_Microsoft.Maui.Controls.Xaml.dll.so => 53
	i64 u0x91418dc638b29e68, ; 283: lib_Xamarin.AndroidX.CustomView.dll.so => 70
	i64 u0x914647982e998267, ; 284: Microsoft.Extensions.Configuration.Json => 41
	i64 u0x9157bd523cd7ed36, ; 285: lib_System.Text.Json.dll.so => 145
	i64 u0x91a74f07b30d37e2, ; 286: System.Linq.dll => 117
	i64 u0x91fa41a87223399f, ; 287: ca/Microsoft.Maui.Controls.resources.dll => 1
	i64 u0x93cfa73ab28d6e35, ; 288: ms/Microsoft.Maui.Controls.resources => 17
	i64 u0x944077d8ca3c6580, ; 289: System.IO.Compression.dll => 112
	i64 u0x967fc325e09bfa8c, ; 290: es/Microsoft.Maui.Controls.resources => 6
	i64 u0x9732d8dbddea3d9a, ; 291: id/Microsoft.Maui.Controls.resources => 13
	i64 u0x978be80e5210d31b, ; 292: Microsoft.Maui.Graphics.dll => 56
	i64 u0x97b8c771ea3e4220, ; 293: System.ComponentModel.dll => 100
	i64 u0x97e144c9d3c6976e, ; 294: System.Collections.Concurrent.dll => 93
	i64 u0x991d510397f92d9d, ; 295: System.Linq.Expressions => 116
	i64 u0x99a00ca5270c6878, ; 296: Xamarin.AndroidX.Navigation.Runtime => 80
	i64 u0x99cdc6d1f2d3a72f, ; 297: ko/Microsoft.Maui.Controls.resources.dll => 16
	i64 u0x9a816d9654deff7c, ; 298: Microsoft.IO.RecyclableMemoryStream => 51
	i64 u0x9d5dbcf5a48583fe, ; 299: lib_Xamarin.AndroidX.Activity.dll.so => 62
	i64 u0x9d74dee1a7725f34, ; 300: Microsoft.Extensions.Configuration.Abstractions.dll => 39
	i64 u0x9e4534b6adaf6e84, ; 301: nl/Microsoft.Maui.Controls.resources => 19
	i64 u0x9eaf1efdf6f7267e, ; 302: Xamarin.AndroidX.Navigation.Common.dll => 78
	i64 u0x9ef542cf1f78c506, ; 303: Xamarin.AndroidX.Lifecycle.LiveData.Core => 74
	i64 u0x9fbb2961ca18e5c2, ; 304: Microsoft.Extensions.FileProviders.Physical.dll => 45
	i64 u0xa0d8259f4cc284ec, ; 305: lib_System.Security.Cryptography.dll.so => 140
	i64 u0xa1440773ee9d341e, ; 306: Xamarin.Google.Android.Material => 87
	i64 u0xa1b9d7c27f47219f, ; 307: Xamarin.AndroidX.Navigation.UI.dll => 81
	i64 u0xa2572680829d2c7c, ; 308: System.IO.Pipelines.dll => 114
	i64 u0xa3c64c49e90a9987, ; 309: System.Security.Cryptography.Pkcs => 61
	i64 u0xa46aa1eaa214539b, ; 310: ko/Microsoft.Maui.Controls.resources => 16
	i64 u0xa4edc8f2ceae241a, ; 311: System.Data.Common.dll => 102
	i64 u0xa5494f40f128ce6a, ; 312: System.Runtime.Serialization.Formatters.dll => 136
	i64 u0xa5b7152421ed6d98, ; 313: lib_System.IO.FileSystem.Watcher.dll.so => 113
	i64 u0xa5e599d1e0524750, ; 314: System.Numerics.Vectors.dll => 129
	i64 u0xa5f1ba49b85dd355, ; 315: System.Security.Cryptography.dll => 140
	i64 u0xa67dbee13e1df9ca, ; 316: Xamarin.AndroidX.SavedState.dll => 83
	i64 u0xa68a420042bb9b1f, ; 317: Xamarin.AndroidX.DrawerLayout.dll => 71
	i64 u0xa763fbb98df8d9fb, ; 318: lib_Microsoft.Win32.Primitives.dll.so => 92
	i64 u0xa78ce3745383236a, ; 319: Xamarin.AndroidX.Lifecycle.Common.Jvm => 73
	i64 u0xa7c31b56b4dc7b33, ; 320: hu/Microsoft.Maui.Controls.resources => 12
	i64 u0xa82fd211eef00a5b, ; 321: Microsoft.Extensions.FileProviders.Physical => 45
	i64 u0xaa2219c8e3449ff5, ; 322: Microsoft.Extensions.Logging.Abstractions => 48
	i64 u0xaa443ac34067eeef, ; 323: System.Private.Xml.dll => 132
	i64 u0xaa52de307ef5d1dd, ; 324: System.Net.Http => 119
	i64 u0xaaaf86367285a918, ; 325: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 43
	i64 u0xaaf84bb3f052a265, ; 326: el/Microsoft.Maui.Controls.resources => 5
	i64 u0xab9c1b2687d86b0b, ; 327: lib_System.Linq.Expressions.dll.so => 116
	i64 u0xabe040529690b3a1, ; 328: EPPlus.System.Drawing => 37
	i64 u0xac2af3fa195a15ce, ; 329: System.Runtime.Numerics => 135
	i64 u0xac5376a2a538dc10, ; 330: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 74
	i64 u0xac79c7e46047ad98, ; 331: System.Security.Principal.Windows.dll => 141
	i64 u0xacd46e002c3ccb97, ; 332: ro/Microsoft.Maui.Controls.resources => 23
	i64 u0xacf42eea7ef9cd12, ; 333: System.Threading.Channels => 147
	i64 u0xad89c07347f1bad6, ; 334: nl/Microsoft.Maui.Controls.resources.dll => 19
	i64 u0xadbb53caf78a79d2, ; 335: System.Web.HttpUtility => 151
	i64 u0xadc90ab061a9e6e4, ; 336: System.ComponentModel.TypeConverter.dll => 99
	i64 u0xadf511667bef3595, ; 337: System.Net.Security => 124
	i64 u0xae031e1cb05086cb, ; 338: lib_EPPlus.Interfaces.dll.so => 36
	i64 u0xae282bcd03739de7, ; 339: Java.Interop => 156
	i64 u0xae53579c90db1107, ; 340: System.ObjectModel.dll => 130
	i64 u0xafe29f45095518e7, ; 341: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 76
	i64 u0xb05b6f0a6cc8ddbb, ; 342: lib_Microsoft.IO.RecyclableMemoryStream.dll.so => 51
	i64 u0xb05cc42cd94c6d9d, ; 343: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 26
	i64 u0xb0bb43dc52ea59f9, ; 344: System.Diagnostics.Tracing.dll => 106
	i64 u0xb220631954820169, ; 345: System.Text.RegularExpressions => 146
	i64 u0xb2a3f67f3bf29fce, ; 346: da/Microsoft.Maui.Controls.resources => 3
	i64 u0xb31efb7ff1c40e7a, ; 347: EPPlus.dll => 35
	i64 u0xb3f0a0fcda8d3ebc, ; 348: Xamarin.AndroidX.CardView => 65
	i64 u0xb4010d9ada170a1a, ; 349: WebDriver.dll => 59
	i64 u0xb46be1aa6d4fff93, ; 350: hi/Microsoft.Maui.Controls.resources => 10
	i64 u0xb477491be13109d8, ; 351: ar/Microsoft.Maui.Controls.resources => 0
	i64 u0xb4bd7015ecee9d86, ; 352: System.IO.Pipelines => 114
	i64 u0xb5c7fcdafbc67ee4, ; 353: Microsoft.Extensions.Logging.Abstractions.dll => 48
	i64 u0xb5ea31d5244c6626, ; 354: System.Threading.ThreadPool.dll => 149
	i64 u0xb7212c4683a94afe, ; 355: System.Drawing.Primitives => 107
	i64 u0xb7b7753d1f319409, ; 356: sv/Microsoft.Maui.Controls.resources => 26
	i64 u0xb81a2c6e0aee50fe, ; 357: lib_System.Private.CoreLib.dll.so => 155
	i64 u0xb9f64d3b230def68, ; 358: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 22
	i64 u0xb9fc3c8a556e3691, ; 359: ja/Microsoft.Maui.Controls.resources => 15
	i64 u0xba48785529705af9, ; 360: System.Collections.dll => 96
	i64 u0xbb65706fde942ce3, ; 361: System.Net.Sockets => 125
	i64 u0xbbd180354b67271a, ; 362: System.Runtime.Serialization.Formatters => 136
	i64 u0xbd0e2c0d55246576, ; 363: System.Net.Http.dll => 119
	i64 u0xbd437a2cdb333d0d, ; 364: Xamarin.AndroidX.ViewPager2 => 86
	i64 u0xbd4f572d2bd0a789, ; 365: System.IO.Compression.ZipFile.dll => 111
	i64 u0xbee1b395605474f1, ; 366: System.Drawing.Common.dll => 60
	i64 u0xbee38d4a88835966, ; 367: Xamarin.AndroidX.AppCompat.AppCompatResources => 64
	i64 u0xc040a4ab55817f58, ; 368: ar/Microsoft.Maui.Controls.resources.dll => 0
	i64 u0xc0d928351ab5ca77, ; 369: System.Console.dll => 101
	i64 u0xc12b8b3afa48329c, ; 370: lib_System.Linq.dll.so => 117
	i64 u0xc1ff9ae3cdb6e1e6, ; 371: Xamarin.AndroidX.Activity.dll => 62
	i64 u0xc256638aedbc4a74, ; 372: EPPlus.Interfaces => 36
	i64 u0xc28c50f32f81cc73, ; 373: ja/Microsoft.Maui.Controls.resources.dll => 15
	i64 u0xc2a3bca55b573141, ; 374: System.IO.FileSystem.Watcher => 113
	i64 u0xc2bcfec99f69365e, ; 375: Xamarin.AndroidX.ViewPager2.dll => 86
	i64 u0xc421b61fd853169d, ; 376: lib_System.Net.WebSockets.Client.dll.so => 127
	i64 u0xc4d3858ed4d08512, ; 377: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 76
	i64 u0xc50fded0ded1418c, ; 378: lib_System.ComponentModel.TypeConverter.dll.so => 99
	i64 u0xc519125d6bc8fb11, ; 379: lib_System.Net.Requests.dll.so => 123
	i64 u0xc5293b19e4dc230e, ; 380: Xamarin.AndroidX.Navigation.Fragment => 79
	i64 u0xc5325b2fcb37446f, ; 381: lib_System.Private.Xml.dll.so => 132
	i64 u0xc5a0f4b95a699af7, ; 382: lib_System.Private.Uri.dll.so => 131
	i64 u0xc659b586d4c229e2, ; 383: Microsoft.Extensions.Configuration.FileExtensions.dll => 40
	i64 u0xc7c01e7d7c93a110, ; 384: System.Text.Encoding.Extensions.dll => 143
	i64 u0xc7ce851898a4548e, ; 385: lib_System.Web.HttpUtility.dll.so => 151
	i64 u0xc858a28d9ee5a6c5, ; 386: lib_System.Collections.Specialized.dll.so => 95
	i64 u0xca3a723e7342c5b6, ; 387: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 28
	i64 u0xcab3493c70141c2d, ; 388: pl/Microsoft.Maui.Controls.resources => 20
	i64 u0xcacfddc9f7c6de76, ; 389: ro/Microsoft.Maui.Controls.resources.dll => 23
	i64 u0xcbd4fdd9cef4a294, ; 390: lib__Microsoft.Android.Resource.Designer.dll.so => 34
	i64 u0xcc2876b32ef2794c, ; 391: lib_System.Text.RegularExpressions.dll.so => 146
	i64 u0xcc5c3bb714c4561e, ; 392: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 89
	i64 u0xcc76886e09b88260, ; 393: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 90
	i64 u0xccf25c4b634ccd3a, ; 394: zh-Hans/Microsoft.Maui.Controls.resources.dll => 32
	i64 u0xcd10a42808629144, ; 395: System.Net.Requests => 123
	i64 u0xcdd0c48b6937b21c, ; 396: Xamarin.AndroidX.SwipeRefreshLayout => 84
	i64 u0xcf23d8093f3ceadf, ; 397: System.Diagnostics.DiagnosticSource.dll => 103
	i64 u0xd1194e1d8a8de83c, ; 398: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 73
	i64 u0xd333d0af9e423810, ; 399: System.Runtime.InteropServices => 133
	i64 u0xd3426d966bb704f5, ; 400: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 64
	i64 u0xd3651b6fc3125825, ; 401: System.Private.Uri.dll => 131
	i64 u0xd373685349b1fe8b, ; 402: Microsoft.Extensions.Logging.dll => 47
	i64 u0xd3e4c8d6a2d5d470, ; 403: it/Microsoft.Maui.Controls.resources => 14
	i64 u0xd4645626dffec99d, ; 404: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 43
	i64 u0xd5507e11a2b2839f, ; 405: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 76
	i64 u0xd6694f8359737e4e, ; 406: Xamarin.AndroidX.SavedState => 83
	i64 u0xd6d21782156bc35b, ; 407: Xamarin.AndroidX.SwipeRefreshLayout.dll => 84
	i64 u0xd72329819cbbbc44, ; 408: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 39
	i64 u0xd7b3764ada9d341d, ; 409: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 48
	i64 u0xda1dfa4c534a9251, ; 410: Microsoft.Extensions.DependencyInjection => 42
	i64 u0xdad05a11827959a3, ; 411: System.Collections.NonGeneric.dll => 94
	i64 u0xdb5383ab5865c007, ; 412: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 30
	i64 u0xdbeda89f832aa805, ; 413: vi/Microsoft.Maui.Controls.resources.dll => 30
	i64 u0xdbf9607a441b4505, ; 414: System.Linq => 117
	i64 u0xdce2c53525640bf3, ; 415: Microsoft.Extensions.Logging => 47
	i64 u0xdd2b722d78ef5f43, ; 416: System.Runtime.dll => 138
	i64 u0xdd67031857c72f96, ; 417: lib_System.Text.Encodings.Web.dll.so => 144
	i64 u0xdde30e6b77aa6f6c, ; 418: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 32
	i64 u0xde8769ebda7d8647, ; 419: hr/Microsoft.Maui.Controls.resources.dll => 11
	i64 u0xe0142572c095a480, ; 420: Xamarin.AndroidX.AppCompat.dll => 63
	i64 u0xe02f89350ec78051, ; 421: Xamarin.AndroidX.CoordinatorLayout.dll => 67
	i64 u0xe192a588d4410686, ; 422: lib_System.IO.Pipelines.dll.so => 114
	i64 u0xe1a08bd3fa539e0d, ; 423: System.Runtime.Loader => 134
	i64 u0xe1ecfdb7fff86067, ; 424: System.Net.Security.dll => 124
	i64 u0xe2420585aeceb728, ; 425: System.Net.Requests.dll => 123
	i64 u0xe29b73bc11392966, ; 426: lib-id-Microsoft.Maui.Controls.resources.dll.so => 13
	i64 u0xe2e426c7714fa0bc, ; 427: Microsoft.Win32.Primitives.dll => 92
	i64 u0xe3811d68d4fe8463, ; 428: pt-BR/Microsoft.Maui.Controls.resources.dll => 21
	i64 u0xe494f7ced4ecd10a, ; 429: hu/Microsoft.Maui.Controls.resources.dll => 12
	i64 u0xe4a9b1e40d1e8917, ; 430: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 7
	i64 u0xe4f74a0b5bf9703f, ; 431: System.Runtime.Serialization.Primitives => 137
	i64 u0xe5434e8a119ceb69, ; 432: lib_Mono.Android.dll.so => 158
	i64 u0xe89a2a9ef110899b, ; 433: System.Drawing.dll => 108
	i64 u0xeb9e30ac32aac03e, ; 434: lib_Microsoft.Win32.SystemEvents.dll.so => 57
	i64 u0xed146ac326fb2a81, ; 435: lib_WebDriver.dll.so => 59
	i64 u0xedc4817167106c23, ; 436: System.Net.Sockets.dll => 125
	i64 u0xedc632067fb20ff3, ; 437: System.Memory.dll => 118
	i64 u0xedc8e4ca71a02a8b, ; 438: Xamarin.AndroidX.Navigation.Runtime.dll => 80
	i64 u0xee81f5b3f1c4f83b, ; 439: System.Threading.ThreadPool => 149
	i64 u0xeeb7ebb80150501b, ; 440: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 66
	i64 u0xef03b1b5a04e9709, ; 441: System.Text.Encoding.CodePages.dll => 142
	i64 u0xef72742e1bcca27a, ; 442: Microsoft.Maui.Essentials.dll => 55
	i64 u0xefec0b7fdc57ec42, ; 443: Xamarin.AndroidX.Activity => 62
	i64 u0xf00c29406ea45e19, ; 444: es/Microsoft.Maui.Controls.resources.dll => 6
	i64 u0xf09e47b6ae914f6e, ; 445: System.Net.NameResolution => 120
	i64 u0xf0de2537ee19c6ca, ; 446: lib_System.Net.WebHeaderCollection.dll.so => 126
	i64 u0xf11b621fc87b983f, ; 447: Microsoft.Maui.Controls.Xaml.dll => 53
	i64 u0xf1c4b4005493d871, ; 448: System.Formats.Asn1.dll => 109
	i64 u0xf238bd79489d3a96, ; 449: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 19
	i64 u0xf37221fda4ef8830, ; 450: lib_Xamarin.Google.Android.Material.dll.so => 87
	i64 u0xf3ddfe05336abf29, ; 451: System => 153
	i64 u0xf4c1dd70a5496a17, ; 452: System.IO.Compression => 112
	i64 u0xf5fc7602fe27b333, ; 453: System.Net.WebHeaderCollection => 126
	i64 u0xf6077741019d7428, ; 454: Xamarin.AndroidX.CoordinatorLayout => 67
	i64 u0xf6de7fa3776f8927, ; 455: lib_Microsoft.Extensions.Configuration.Json.dll.so => 41
	i64 u0xf77b20923f07c667, ; 456: de/Microsoft.Maui.Controls.resources.dll => 4
	i64 u0xf7e2cac4c45067b3, ; 457: lib_System.Numerics.Vectors.dll.so => 129
	i64 u0xf7e74930e0e3d214, ; 458: zh-HK/Microsoft.Maui.Controls.resources.dll => 31
	i64 u0xf84773b5c81e3cef, ; 459: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 29
	i64 u0xf8e045dc345b2ea3, ; 460: lib_Xamarin.AndroidX.RecyclerView.dll.so => 82
	i64 u0xf915dc29808193a1, ; 461: System.Web.HttpUtility.dll => 151
	i64 u0xf96c777a2a0686f4, ; 462: hi/Microsoft.Maui.Controls.resources.dll => 10
	i64 u0xf9eec5bb3a6aedc6, ; 463: Microsoft.Extensions.Options => 49
	i64 u0xfa3f278f288b0e84, ; 464: lib_System.Net.Security.dll.so => 124
	i64 u0xfa504dfa0f097d72, ; 465: Microsoft.Extensions.FileProviders.Abstractions.dll => 44
	i64 u0xfa5ed7226d978949, ; 466: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 0
	i64 u0xfa645d91e9fc4cba, ; 467: System.Threading.Thread => 148
	i64 u0xfbf0a31c9fc34bc4, ; 468: lib_System.Net.Http.dll.so => 119
	i64 u0xfc6b7527cc280b3f, ; 469: lib_System.Runtime.Serialization.Formatters.dll.so => 136
	i64 u0xfc719aec26adf9d9, ; 470: Xamarin.AndroidX.Navigation.Fragment.dll => 79
	i64 u0xfd22f00870e40ae0, ; 471: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 71
	i64 u0xfd536c702f64dc47, ; 472: System.Text.Encoding.Extensions => 143
	i64 u0xfd583f7657b6a1cb, ; 473: Xamarin.AndroidX.Fragment => 72
	i64 u0xfda36abccf05cf5c, ; 474: System.Net.WebSockets.Client => 127
	i64 u0xfe9856c3af9365ab, ; 475: lib_Microsoft.Extensions.Configuration.FileExtensions.dll.so => 40
	i64 u0xfeae9952cf03b8cb ; 476: tr/Microsoft.Maui.Controls.resources => 28
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [477 x i32] [
	i32 84, i32 97, i32 80, i32 61, i32 157, i32 63, i32 51, i32 24,
	i32 2, i32 30, i32 122, i32 82, i32 96, i32 54, i32 31, i32 66,
	i32 24, i32 94, i32 71, i32 97, i32 49, i32 94, i32 140, i32 147,
	i32 25, i32 90, i32 85, i32 21, i32 158, i32 55, i32 120, i32 70,
	i32 110, i32 128, i32 82, i32 60, i32 8, i32 156, i32 9, i32 43,
	i32 128, i32 92, i32 115, i32 154, i32 12, i32 144, i32 90, i32 37,
	i32 18, i32 139, i32 93, i32 153, i32 27, i32 45, i32 157, i32 81,
	i32 16, i32 49, i32 110, i32 104, i32 35, i32 138, i32 111, i32 27,
	i32 115, i32 148, i32 101, i32 68, i32 137, i32 8, i32 59, i32 88,
	i32 50, i32 13, i32 11, i32 128, i32 156, i32 122, i32 29, i32 121,
	i32 105, i32 7, i32 146, i32 109, i32 33, i32 46, i32 36, i32 20,
	i32 142, i32 150, i32 26, i32 145, i32 5, i32 104, i32 152, i32 106,
	i32 72, i32 34, i32 65, i32 107, i32 8, i32 152, i32 46, i32 6,
	i32 125, i32 54, i32 2, i32 52, i32 97, i32 86, i32 38, i32 70,
	i32 120, i32 85, i32 1, i32 44, i32 143, i32 88, i32 58, i32 149,
	i32 68, i32 40, i32 78, i32 64, i32 154, i32 158, i32 20, i32 137,
	i32 88, i32 105, i32 24, i32 22, i32 130, i32 81, i32 145, i32 77,
	i32 121, i32 127, i32 116, i32 132, i32 134, i32 58, i32 14, i32 77,
	i32 157, i32 142, i32 147, i32 1, i32 52, i32 75, i32 108, i32 122,
	i32 102, i32 68, i32 56, i32 25, i32 121, i32 31, i32 139, i32 138,
	i32 73, i32 95, i32 58, i32 131, i32 155, i32 103, i32 15, i32 42,
	i32 67, i32 150, i32 100, i32 3, i32 91, i32 47, i32 126, i32 133,
	i32 66, i32 95, i32 144, i32 98, i32 152, i32 102, i32 5, i32 42,
	i32 89, i32 118, i32 53, i32 4, i32 134, i32 155, i32 91, i32 87,
	i32 52, i32 135, i32 35, i32 101, i32 75, i32 60, i32 69, i32 3,
	i32 107, i32 109, i32 9, i32 133, i32 18, i32 56, i32 50, i32 69,
	i32 50, i32 79, i32 54, i32 2, i32 113, i32 28, i32 18, i32 14,
	i32 98, i32 61, i32 11, i32 111, i32 118, i32 38, i32 83, i32 135,
	i32 41, i32 17, i32 27, i32 72, i32 57, i32 7, i32 99, i32 25,
	i32 4, i32 17, i32 129, i32 96, i32 106, i32 139, i32 130, i32 100,
	i32 85, i32 39, i32 74, i32 153, i32 33, i32 63, i32 65, i32 108,
	i32 29, i32 32, i32 37, i32 115, i32 33, i32 38, i32 46, i32 148,
	i32 110, i32 55, i32 89, i32 154, i32 98, i32 91, i32 77, i32 103,
	i32 141, i32 104, i32 9, i32 57, i32 44, i32 141, i32 69, i32 150,
	i32 93, i32 78, i32 10, i32 23, i32 22, i32 21, i32 105, i32 34,
	i32 112, i32 75, i32 53, i32 70, i32 41, i32 145, i32 117, i32 1,
	i32 17, i32 112, i32 6, i32 13, i32 56, i32 100, i32 93, i32 116,
	i32 80, i32 16, i32 51, i32 62, i32 39, i32 19, i32 78, i32 74,
	i32 45, i32 140, i32 87, i32 81, i32 114, i32 61, i32 16, i32 102,
	i32 136, i32 113, i32 129, i32 140, i32 83, i32 71, i32 92, i32 73,
	i32 12, i32 45, i32 48, i32 132, i32 119, i32 43, i32 5, i32 116,
	i32 37, i32 135, i32 74, i32 141, i32 23, i32 147, i32 19, i32 151,
	i32 99, i32 124, i32 36, i32 156, i32 130, i32 76, i32 51, i32 26,
	i32 106, i32 146, i32 3, i32 35, i32 65, i32 59, i32 10, i32 0,
	i32 114, i32 48, i32 149, i32 107, i32 26, i32 155, i32 22, i32 15,
	i32 96, i32 125, i32 136, i32 119, i32 86, i32 111, i32 60, i32 64,
	i32 0, i32 101, i32 117, i32 62, i32 36, i32 15, i32 113, i32 86,
	i32 127, i32 76, i32 99, i32 123, i32 79, i32 132, i32 131, i32 40,
	i32 143, i32 151, i32 95, i32 28, i32 20, i32 23, i32 34, i32 146,
	i32 89, i32 90, i32 32, i32 123, i32 84, i32 103, i32 73, i32 133,
	i32 64, i32 131, i32 47, i32 14, i32 43, i32 76, i32 83, i32 84,
	i32 39, i32 48, i32 42, i32 94, i32 30, i32 30, i32 117, i32 47,
	i32 138, i32 144, i32 32, i32 11, i32 63, i32 67, i32 114, i32 134,
	i32 124, i32 123, i32 13, i32 92, i32 21, i32 12, i32 7, i32 137,
	i32 158, i32 108, i32 57, i32 59, i32 125, i32 118, i32 80, i32 149,
	i32 66, i32 142, i32 55, i32 62, i32 6, i32 120, i32 126, i32 53,
	i32 109, i32 19, i32 87, i32 153, i32 112, i32 126, i32 67, i32 41,
	i32 4, i32 129, i32 31, i32 29, i32 82, i32 151, i32 10, i32 49,
	i32 124, i32 44, i32 0, i32 148, i32 119, i32 136, i32 79, i32 71,
	i32 143, i32 72, i32 127, i32 40, i32 28
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ 278e101698269c9bc8840aa94d72e7f24066a96d"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
