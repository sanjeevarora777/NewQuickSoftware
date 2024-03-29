﻿<%@ Page Language="C#" MasterPageFile="~/DryMasterMain.master" AutoEventWireup="true" Inherits="PaymentReport" Title="Payment Report" Codebehind="PaymentReport.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" language="javascript">
        function checkEntry() {
            var ReportFrmChecked = document.getElementById("<%=radReportFrom.ClientID %>").checked;
            var frmDate = document.getElementById("<%=txtReportFrom.ClientID %>").value;
            var toDate = document.getElementById("<%=txtReportUpto.ClientID %>").value;

            if (ReportFrmChecked == true) {
                if (frmDate == "" || toDate == "") {
                    alert("Please select date from and upto which report is to be generated.");
                    document.getElementById("<%=txtReportFrom.ClientID %>").focus();
                    return false;
                }
            }
        }
        function SetUptoDate() {
            //document.getElementById('<%= txtReportUpto.ClientID %>').value = document.getElementById('<%= txtReportFrom.ClientID %>').value;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <fieldset class="Fieldset">
        <table width="100%">
            <tr>
                <td style="width: 7px">
                </td>
                <td class="H1" style="font-weight: bolder">
                    <asp:Label ID="Label1" runat="server" Text="DrySoft " ForeColor="#FF9933"></asp:Label>Payment
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <hr style="width: 100%; border-bottom: 1px #5081A1 solid;" />
                </td>
            </tr>
        </table>
        <table class="TableData" width="100%">
            <tr valign="top">
                <td>
                    <table class="TableData" width="100%">
                        <tr>
                            <td>
                                <table class="TableData" width="100%">
                                    <tr>
                                        <td nowrap="nowrap">
                                            <asp:RadioButton ID="radReportFrom" runat="server" Checked="True" GroupName="radReportOptions"
                                                Text="From" CssClass="TDCaption" />
                                            &nbsp;<asp:TextBox ID="txtReportFrom" runat="server" Width="80px" onkeypress="return false;"
                                                onpaste="return false;" onchange="return SetUptoDate();" />
                                            <asp:Image ID="imgReportFrom" runat="server" ImageUrl="~/images/Calendar_scheduleHS.png" />
                                            <cc1:CalendarExtender ID="txtReportFrom_CalendarExtender" runat="server" PopupButtonID="imgReportFrom"
                                                Format="dd MMM yyyy" TargetControlID="txtReportFrom">
                                            </cc1:CalendarExtender>
                                            &nbsp;<span class="TDCaption">To</span>
                                            <asp:TextBox ID="txtReportUpto" runat="server" Width="80px" onkeypress="return false;"
                                                onpaste="return false;" />
                                            <asp:Image ID="imgReportUpto" runat="server" ImageUrl="~/images/Calendar_scheduleHS.png" />
                                            <cc1:CalendarExtender ID="txtReportUpto_CalendarExtender" runat="server" PopupButtonID="imgReportUpto"
                                                Format="dd MMM yyyy" TargetControlID="txtReportUpto">
                                            </cc1:CalendarExtender>
                                            <asp:RadioButton ID="radReportMonthly" runat="server" GroupName="radReportOptions"
                                                Text="Monthly Report" CssClass="TDCaption" />
                                            &nbsp;<asp:DropDownList ID="drpMonthList" runat="server">
                                                <asp:ListItem Selected="True" Value="1">January</asp:ListItem>
                                                <asp:ListItem Value="2">February</asp:ListItem>
                                                <asp:ListItem Value="3">March</asp:ListItem>
                                                <asp:ListItem Value="4">April</asp:ListItem>
                                                <asp:ListItem Value="5">May</asp:ListItem>
                                                <asp:ListItem Value="6">June</asp:ListItem>
                                                <asp:ListItem Value="7">July</asp:ListItem>
                                                <asp:ListItem Value="8">August</asp:ListItem>
                                                <asp:ListItem Value="9">September</asp:ListItem>
                                                <asp:ListItem Value="10">October</asp:ListItem>
                                                <asp:ListItem Value="11">November</asp:ListItem>
                                                <asp:ListItem Value="12">December</asp:ListItem>
                                            </asp:DropDownList>
                                            &nbsp;<asp:DropDownList ID="drpYearList" runat="server">
                                            </asp:DropDownList>
                                            <asp:Button ID="btnShowReport" runat="server" Text="Show" OnClientClick="return checkEntry();"
                                                OnClick="btnShowReport_Click" />
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:Label ID="lblMsg" runat="server" EnableViewState="False" ForeColor="#CC0000"></asp:Label>
                                <div class="DivStyleWithScroll" style="width: 100%; overflow: scroll; height: 250px;">
                                    <asp:GridView ID="grdReport" runat="server" Visible="False" AutoGenerateColumns="False"
                                        DataKeyNames="BookingNumber" ShowFooter="True" EmptyDataText="No Records found"
                                        CssClass="mGrid">
                                        <Columns>
                                            <asp:BoundField DataField="PaymentDate" DataFormatString="{0:d}" HeaderText="Payment Date"
                                                SortExpression="PaymentDate" FooterText="Total" />
                                            <asp:BoundField DataField="BookingNumber" HeaderText="Booking Number" SortExpression="BookingNumber"
                                                FooterText="" />
                                            <asp:BoundField DataField="CustName" HeaderText="Customer Name" SortExpression="CustName"
                                                FooterText="" />
                                            <asp:BoundField DataField="PaymentMade" HeaderText="Net Paid" SortExpression="PaymentMade">
                                                <FooterStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="BalanceAmount" HeaderText="Balance Amount" SortExpression="Balance">
                                                <FooterStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:Button ID="btnExport" runat="server" OnClick="btnExport_Click" Text="Export to Excel"
                                    Visible="False" />
                                <asp:SqlDataSource ID="SqlSourceReportBooking" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="Sp_Sel_PaymentReport" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter Name="PaymentDate1" DefaultValue="" />
                                        <asp:Parameter Name="PaymentDate2" DefaultValue="" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
