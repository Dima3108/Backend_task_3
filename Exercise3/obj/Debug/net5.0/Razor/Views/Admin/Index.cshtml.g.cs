#pragma checksum "C:\Users\Дмитрий\github_repo\Backend_task_3\Exercise3\Views\Admin\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "66e886c4feae6f1131152406b12599f3b9119dd4"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Admin_Index), @"mvc.1.0.view", @"/Views/Admin/Index.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 5 "C:\Users\Дмитрий\github_repo\Backend_task_3\Exercise3\Views\Admin\Index.cshtml"
using Exercise3.Models;

#line default
#line hidden
#nullable disable
#nullable restore
#line 6 "C:\Users\Дмитрий\github_repo\Backend_task_3\Exercise3\Views\Admin\Index.cshtml"
using Exercise3.Data;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"66e886c4feae6f1131152406b12599f3b9119dd4", @"/Views/Admin/Index.cshtml")]
    public class Views_Admin_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.BodyTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\Дмитрий\github_repo\Backend_task_3\Exercise3\Views\Admin\Index.cshtml"
  
    Layout = null;

#line default
#line hidden
#nullable disable
            WriteLiteral("<!DOCTYPE html>\r\n<html>\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("body", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "66e886c4feae6f1131152406b12599f3b9119dd43119", async() => {
                WriteLiteral("\r\n");
#nullable restore
#line 10 "C:\Users\Дмитрий\github_repo\Backend_task_3\Exercise3\Views\Admin\Index.cshtml"
       
        var array = FormDataProvider.sstoregeData.GetElements();
        

#line default
#line hidden
#nullable disable
#nullable restore
#line 12 "C:\Users\Дмитрий\github_repo\Backend_task_3\Exercise3\Views\Admin\Index.cshtml"
         foreach(var el in array)
            {

#line default
#line hidden
#nullable disable
                WriteLiteral("                <div>\r\n                    <div>\r\n                        <label>Имя : ");
#nullable restore
#line 16 "C:\Users\Дмитрий\github_repo\Backend_task_3\Exercise3\Views\Admin\Index.cshtml"
                                Write(el.name);

#line default
#line hidden
#nullable disable
                WriteLiteral("</label>\r\n                    </div>\r\n                    <div>\r\n                        <label>почта: ");
#nullable restore
#line 19 "C:\Users\Дмитрий\github_repo\Backend_task_3\Exercise3\Views\Admin\Index.cshtml"
                                 Write(el.email);

#line default
#line hidden
#nullable disable
                WriteLiteral("</label>\r\n                    </div>\r\n                    <div>\r\n                        <label>Дата рождения: ");
#nullable restore
#line 22 "C:\Users\Дмитрий\github_repo\Backend_task_3\Exercise3\Views\Admin\Index.cshtml"
                                         Write(el.date);

#line default
#line hidden
#nullable disable
                WriteLiteral("</label> \r\n                    </div>\r\n                    <div>\r\n                        <label>Пол: ");
#nullable restore
#line 25 "C:\Users\Дмитрий\github_repo\Backend_task_3\Exercise3\Views\Admin\Index.cshtml"
                               Write(el.pol.ToString());

#line default
#line hidden
#nullable disable
                WriteLiteral("</label>\r\n                    </div>\r\n                    <div>\r\n                        <label>Количество конечностей:  ");
#nullable restore
#line 28 "C:\Users\Дмитрий\github_repo\Backend_task_3\Exercise3\Views\Admin\Index.cshtml"
                                                   Write(el.count_con);

#line default
#line hidden
#nullable disable
                WriteLiteral("</label>\r\n                    </div>\r\n                    <div>\r\n                        <label>Биография:\r\n                        <textarea>");
#nullable restore
#line 32 "C:\Users\Дмитрий\github_repo\Backend_task_3\Exercise3\Views\Admin\Index.cshtml"
                             Write(el.biograf);

#line default
#line hidden
#nullable disable
                WriteLiteral("</textarea>\r\n                        </label>\r\n                    </div>\r\n                    <div>\r\n                        <div>\r\n                            Суперспособности:\r\n                            <div>\r\n");
#nullable restore
#line 39 "C:\Users\Дмитрий\github_repo\Backend_task_3\Exercise3\Views\Admin\Index.cshtml"
                                  
if(el.supers!=null&&el.supers.Length>0)
                                    foreach(string v in el.supers)
                {

#line default
#line hidden
#nullable disable
                WriteLiteral("                    <div>");
#nullable restore
#line 43 "C:\Users\Дмитрий\github_repo\Backend_task_3\Exercise3\Views\Admin\Index.cshtml"
                    Write(v);

#line default
#line hidden
#nullable disable
                WriteLiteral("</div>\r\n");
#nullable restore
#line 44 "C:\Users\Дмитрий\github_repo\Backend_task_3\Exercise3\Views\Admin\Index.cshtml"
                }
                                

#line default
#line hidden
#nullable disable
                WriteLiteral("                            </div>\r\n                            \r\n                        </div>\r\n                    </div>\r\n                </div>\r\n");
#nullable restore
#line 51 "C:\Users\Дмитрий\github_repo\Backend_task_3\Exercise3\Views\Admin\Index.cshtml"
            }

#line default
#line hidden
#nullable disable
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.BodyTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n</html>");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; }
    }
}
#pragma warning restore 1591
