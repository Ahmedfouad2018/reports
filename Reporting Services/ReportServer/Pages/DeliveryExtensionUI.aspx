<%@ Register TagPrefix="RS" Namespace="Microsoft.ReportingServices.WebServer" Assembly="ReportingServicesWebServer" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryExtensionUI.aspx.cs" Inherits="Microsoft.ReportingServices.WebServer.DeliveryExtensionUI" %>
<!DOCTYPE html>
<script type="text/javascript" lang="javascript">
    function receiveMessage(event) {
        if (event.origin === window.parent.location.origin) {
            var receivedData = JSON.parse(event.data);
            document.getElementById('hiddenUserDataJson').value = receivedData.data;
            document.getElementById('hiddenPostOperation').value = receivedData.operation;
            Page_ValidationActive = false;
            document.getElementById('hiddenFormControl').click();
        }
    }
    window.addEventListener("message", receiveMessage, false);
</script>