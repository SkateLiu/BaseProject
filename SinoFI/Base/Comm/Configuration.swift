// MARK: -                              配置文件


//host地址
let host = "https//:baidu.com"
//开发模式
var developModel = false
//友盟key
let UMKey = "123456"
//友盟secrt
let UMSecrt = "123456"



















#if DEBUG
import UIKit
#endif
///自定义打印 release版本自动关闭
func DLLog<T>(_ message: T, method: String = #function, line: Int = #line,fileName:String = #file)
{
    #if DEBUG
        print("文件名————————>\((fileName as NSString).lastPathComponent)方法名————————>"+"\(method)"+"行号————————>"+"\(line)"+"]"+"     "+"message-————————>"+"\(message)")
        developModel = false
    #endif
}
