<%@ Register TagPrefix="RS" Namespace="Microsoft.ReportingServices.WebServer" Assembly="ReportingServicesWebServer" %>
<%@ Page Language="C#" AutoEventWireup="true" Inherits="Microsoft.ReportingServices.WebServer.ReportViewerPage" EnableEventValidation="false" %>
<asp:literal runat="server" id="docType"></asp:literal>
<html>
 <head id="headID" runat="server">
  <asp:literal runat="server" id="httpEquiv"></asp:literal>
  <title><%= GetPageTitle() %></title>
 </head>
 <body style="margin: 0px; overflow: auto">
  <form style="width:100%;height:100%" runat="server" ID="ReportViewerForm">
   <asp:ScriptManager ID="AjaxScriptManager" AsyncPostBackTimeout="0" runat="server" />
    <table cellspacing="0" cellpadding="0" width="100%" height="100%"><tr height="100%"><td width="100%">
   <RS:ReportViewerHost ID="ReportViewerControl" runat="server" />
    </td></tr></table>
  </form>
  <script language="javascript" type="text/javascript">
Sys.WebForms.PageRequestManager.prototype._destroyTree = function(element) {
    var allnodes = element.getElementsByTagName('*'),
        length = allnodes.length;
    var nodes = new Array(length);
    for (var k = 0; k < length; k++) {
        nodes[k] = allnodes[k];
    }
    for (var j = 0, l = nodes.length; j < l; j++) {
        var node = nodes[j];
        if (node.nodeType === 1) {
            if (node.dispose && typeof (node.dispose) === "function") {
                node.dispose();
            }
            else if (node.control && typeof (node.control.dispose) === "function") {
                node.control.dispose();
            }
            var behaviors = node._behaviors;
            if (behaviors) {
                behaviors = Array.apply(null, behaviors);
                for (var k = behaviors.length - 1; k >= 0; k--) {
                    behaviors[k].dispose();
                }
            }
        }
    }
}
  </script>
 </body>
</html>
