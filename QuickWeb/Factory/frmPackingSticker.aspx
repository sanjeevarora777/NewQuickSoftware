﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Factory/Factory.Master" AutoEventWireup="true"
    CodeBehind="frmPackingSticker.aspx.cs" Inherits="QuickWeb.Factory.frmPackingSticker"
    EnableEventValidation="false" ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="../css/loader.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid margin-left-right">
        <div class="row-fluid">
            <div class="span2">
                <asp:TextBox ID="txtBarcode" runat="server" placeholder="Barcode / Order No" EnableTheming="False"
                    ClientIDMode="Static" AutoComplete="off" OnTextChanged="txtBarcode_TextChanged"
                    CssClass="span12 form-control" MaxLength="20"></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="txtBarcode_FilteredTextBoxExtender" runat="server"
                    Enabled="True" TargetControlID="txtBarcode" ValidChars="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-">
                </cc1:FilteredTextBoxExtender>
            </div>
            <div class="span2">
                <asp:TextBox ID="txtDueDate" runat="server" placeholder="Due Date" EnableTheming="False"
                    onpaste="return false;" onkeypress="return false;" ClientIDMode="Static" AutoComplete="off"
                    CssClass="span12 form-control"></asp:TextBox>
                <cc1:CalendarExtender ID="txtHolidayDate_CalendarExtender" runat="server" Enabled="True"
                    Format="dd-MMM-yyyy" TargetControlID="txtDueDate">
                </cc1:CalendarExtender>
            </div>
            <div class="span3">
                <div class="input-group">
                    <span class="input-group-addon">Start Printing from Sticker Number: </span>
                    <asp:DropDownList ID="drpPrintStartFrom" runat="server" EnableTheming="False" CssClass="span3 form-control" Width="60px"
                        ClientIDMode="Static">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="span2">
                <a class="span12 btn btn-primary" id="btnSave" runat="server" clientidmode="static">
                    <i class="fa fa-check icon-white"></i>&nbsp;Print Sticker</a>
            </div>
            <div class="span2">
                <a class="span12 btn btn-primary" id="btnRefresh" runat="server" clientidmode="static">
                    <i class="fa fa-refresh icon-white"></i>&nbsp;Refresh</a>
            </div>
        </div>
        <div class="row-fluid div-margin">
            <div class="span1 well well-small">
                <div class="span label label-default aligncenter">
                    <h4 id="lblLeft">
                        &nbsp;
                    </h4>
                </div>
            </div>
            <div class="span10 well well-small" id="DivContainerStatus">
                <div class="span label label-default  aligncenter">
                    <h4 id="lblStatusCloth" runat="server">
                        &nbsp;
                    </h4>
                </div>
            </div>
            <div class="span1 well well-small">
                <div class="span label label-default  aligncenter">
                    <h4 id="lblQtyCount">
                        &nbsp;
                    </h4>
                </div>
            </div>
        </div>
        <!-- Div Container for GRid Start Here -->
        <div class="row-fluid form-signin4 no-bottom-margin">
            <div class="span6 well well-small no-bottom-margin">
               <div class="DivStyleWithScroll" style="overflow: scroll; height: 400px;">
                    <asp:GridView ID="grdNewChallan" runat="server" CssClass="mgrid" AutoGenerateColumns="False"
                        ShowFooter="False" EmptyDataText="There are no pending Cloths to generate packing stickers."
                        EnableTheming="false" OnDataBinding="grdNewChallan_DataBinding" OnDataBound="grdNewChallan_DataBound"
                        OnRowDataBound="grdNewChallan_RowDataBound">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ControlStyle-CssClass="rowNumber">
                                <HeaderTemplate>
                                    <asp:Label ID="Label2" runat="server" Text="RowNumber"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblRowNumber"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="BookingNumber" HeaderText="Order" ReadOnly="True" SortExpression="BookingNumber">
                            </asp:BoundField>
                            <asp:BoundField DataField="BookingDeliveryDate" HeaderText="Due Date" ReadOnly="True"
                                SortExpression="BookingDeliveyDate"></asp:BoundField>
                            <asp:BoundField DataField="Barcode" HeaderText="Barcode" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="BranchName" HeaderText="Branch Name" ReadOnly="True" SortExpression="BranchName">
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Cloth" SortExpression="ItemName">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdnItemSNo" runat="server" Value='<%# Bind("ISN") %>' />
                                    <asp:Label ID="lblItemName" runat="server" Text='<%# Bind("SubItemName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="U">
                                <ItemTemplate>
                                    <asp:Label ID="lblUrgent" runat="server" Text='<%# Eval("IsUrgent").ToString() == "True" ? "Yes": "" %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Service">
                                <ItemTemplate>
                                    <asp:Label ID="lblMainProcess" runat="server" Text='<%# Eval("ItemProcessType").ToString() == "None" ? "": Eval("ItemProcessType").ToString()  %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="span1 well well-small  gridhight-noscroll no-bottom-margin">
                <div class="spacer">
                </div>
                <div class="btn btn-default btn-sm btn-block disabled">
                    Move
                </div>
                <div class="btn btn-info btn-sm btn-block" id="btnMoveRight">
                    <i class="fa fa-chevron-right fa-lg  icon-white"></i>
                </div>
                <div class="btn btn-info btn-sm btn-block" id="btnMoveLeft">
                    <i class="fa fa-chevron-left fa-lg icon-white"></i>
                </div>
                <div class="spacer">
                </div>
                <div class="btn btn-default btn-sm btn-block disabled">
                    Move All</div>
                <div class="btn btn-info btn-sm btn-block" id="btnMoveRightAll">
                    <i class="fa fa-chevron-right fa-lg icon-white"></i><i class="fa fa-chevron-right fa-lg icon-white">
                    </i>
                </div>
                <div class="btn btn-info btn-sm btn-block" id="btnMoveLeftAll">
                    <i class="fa fa-chevron-left fa-lg icon-white"></i><i class="fa fa-chevron-left fa-lg icon-white">
                    </i>
                </div>
                <div class="spacer">
                </div>
            </div>
            <div class="span5 well well-small no-bottom-margin">
               <div class="DivStyleWithScroll" style="overflow: scroll; height: 400px;">
                    <asp:GridView ID="grdSelectedCloth" runat="server" CssClass="mgrid" AutoGenerateColumns="False"
                        EmptyDataText="There are no pending Cloths to generate packing stickers." EnableTheming="false"
                        ShowFooter="False" OnRowDataBound="grdSelectedCloth_RowDataBound">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ControlStyle-CssClass="rowNumber">
                                <HeaderTemplate>
                                    <asp:Label ID="Label2" runat="server" Text="RowNumber"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblRowNumber"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="BookingNumber" HeaderText="Order" ReadOnly="True" SortExpression="BookingNumber">
                            </asp:BoundField>
                            <asp:BoundField DataField="BookingDeliveryDate" HeaderText="Due Date" ReadOnly="True"
                                SortExpression="BookingDeliveyDate"></asp:BoundField>
                            <asp:BoundField DataField="Barcode" HeaderText="Barcode" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="BranchName" HeaderText="Branch Name" ReadOnly="True" SortExpression="BranchName">
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Cloth" SortExpression="ItemName">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdnItemSNo" runat="server" Value='<%# Bind("ISN") %>' />
                                    <asp:Label ID="lblItemName" runat="server" Text='<%# Bind("SubItemName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="U">
                                <ItemTemplate>
                                    <asp:Label ID="lblUrgent" runat="server" Text='<%# Eval("IsUrgent").ToString() == "True" ? "Yes": "" %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Service">
                                <ItemTemplate>
                                    <asp:Label ID="lblMainProcess" runat="server" Text='<%# Eval("ItemProcessType").ToString() == "None" ? "": Eval("ItemProcessType").ToString()  %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <asp:HiddenField runat="server" ID="hdnAddedHeader" Value="false" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnRemovedEmptyMessage" Value="false" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnAllData" Value="false" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnBookingCount" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnAllBookingNumber" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnAllBookingCount" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnAllCheckBoxLeft" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnAllRowMoveNumFromLTR" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnAllRowMoveNumFromRTL" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnLTRPrevCount" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnRTLPrevCount" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnEmptyRow" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnAllHtml" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnCloseMe" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnRmvReason" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnRmvReasonData" ClientIDMode="Static" />
        <asp:Button ID="btnTemp" runat="server" OnClick="btnTemp_Click" Style="display: none"
            ClientIDMode="Static" />
             <asp:Panel ID="pnlMsg" runat="server" Style="display: none" ClientIDMode="Static">
        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
            <ContentTemplate>
                <div>
                    <br />
                    <span class="fa  textBold">Please Wait..</span>
                    <img src="../images/ajax-loader.gif" style="margin-top: 5px; margin-left: 25%" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    </div>
    <!-- Start of js -->
   
    <%--<script src="../js/jquery-ui-1.8.23.custom.min.js" type="text/javascript"></script>--%>
       <script src="../JavaScript/javascript.js" type="text/javascript"></script>
    <script src="../JavaScript/code.js" type="text/javascript"></script>
    <script src="../js/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/jquery.blockUI.js"></script>
    <script type="text/javascript" src="../js/jBeep.min.js"></script>
    <script src="../js/loader.js" type="text/javascript"></script>
    <script src="../js/JSuccess.js" type="text/javascript"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            if ($('#hdnCloseMe').val() == 'true') {
                var win = window.open("about:blank", "_self");
                win.close();
            }
            var stateOfColor = true;
            setcolorOfDiv('LightSteelBlue');
            $('#hdnAddedHeader').val('false');
            $('#hdnRemovedEmptyMessage').val('false');
            //setDivMouseOver('#B0C4DE', '#00aa00');
            $.extend($.expr[':'], { excontains: function (obj, index, meta, stack) { return (obj.textContent || obj.innerText || $(obj).text() || "").toLowerCase() == meta[3].toLowerCase(); } });
            var _RowsToMoveFromLeftToRight = new Array();
            var _RowsToMoveFromRightToLeft = new Array();
            if ($('#hdnAllHtml').val() != '' && $('#hdnAllHtml').val() != -1) {
                $('#ctl00_ContentPlaceHolder1_grdSelectedCloth').closest('div').html($('#hdnAllHtml').val());
            }
            else if ($('#hdnAllHtml').val() == '-1') {
                //$('#ctl00_ContentPlaceHolder1_grdSelectedCloth').closest('div').html('');
                $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:not(:first-child)');
            }
            setQtyInLabel();
            $('#hdnAllRowMoveNumFromLTR').val('');
            $('#hdnAllRowMoveNumFromRTL').val('');
            $('#hdnLTRPrevCount').val('');
            $('#hdnRTLPrevCount').val('');
            // removeRedundantRowsFromGrid('ctl00_ContentPlaceHolder1_grdNewChallan', 'ctl00_ContentPlaceHolder1_grdSelectedCloth', 5, true);
            //$('#btnClearDate').attr('disabled', true);
            disableButtons();
            $('body').click(function (event) {
                if ($(event.target).attr('id') == 'drpPrintStartFrom') {
                    return;
                }
                if ($(event.target).attr('id') == 'txtDueDate') {
                    return;
                }
                $('#txtBarcode').focus();
            });
            $("#txtDueDate").change(function () {
                var _allRowsCount = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr').size();
                if (_allRowsCount > 1) {
                    // save the html of this grid, and on load, show it, also set the empty row removed and header copied to true
                    var _allHTMLToSave = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth').closest('div').html();
                    $('#pnlMsg').dialog({ width: 100, height: 120, modal: true });
                    __doPostBack('ctl00$ContentPlaceHolder1$btnTemp', _allHTMLToSave);
                }
                else {
                    $('#pnlMsg').dialog({ width: 100, height: 120, modal: true });
                    __doPostBack('ctl00$ContentPlaceHolder1$btnTemp', null);
                }
                //document.getElementById("ctl00_ContentPlaceHolder1_btnTemp").click();
            });

            /******* HERE WAS THE CODE FOR DATE FILTER, IN CASE NEED TO ADD IT LATER *****/
            /******* HERE WAS THE CODE FOR REMOVE CLOTH FILTER, IN CASE NEED TO ADD IT LATER *****/
            /*
            $('#ctl00_ContentPlaceHolder1_drpBranch').change(function (e) {

            var _allRowsCount = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr').size();
            if (_allRowsCount > 1) {
            // save the html of this grid, and on load, show it, also set the empty row removed and header copied to true
            var _allHTMLToSave = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth').closest('div').html();
            __doPostBack('ctl00$ContentPlaceHolder1$drpBranch', _allHTMLToSave);
            }
            else {
            __doPostBack('ctl00$ContentPlaceHolder1$drpBranch', null);
            }

            });
            */
            var _bKNumToSearch;
            var _bkNumFind;
            var _bkFooterRowGridNew;


            $('#txtBarcode').keydown(function (event) {

                if (event.which == 13 || event.which == 9) {
                    var _myVal = $(this).val().toUpperCase();
                    if (_myVal.indexOf('-') != -1) {
                        // first copy the header, just first time though
                        if ($('#hdnAddedHeader').val() == 'false') {
                            $('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr:eq(0)').clone().insertAfter('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:first');
                            $('#hdnAddedHeader').val('true');
                        }
                        // first remove the empty text if not already removed
                        if ($('#hdnRemovedEmptyMessage').val() == 'false') {
                            $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:eq(0)').remove();
                            $('#hdnRemovedEmptyMessage').val('true');
                        }
                        console.warn('Could give error use excontains instead');
                        var _curRow = $('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody').find(':contains(' + '*' + _myVal + '*' + ')').closest('tr');
                        if (_curRow.size() == 1) {
                            /* This will change previous colors */
                            // $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr').filter(function () { return $(this).css('background-color') != 'transparent'; }).css('background-color', 'transparent');
                            $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr >td').filter(function () { return $(this).css('background-color') != 'rgb(229, 229, 229)'; }).css('background-color', 'rgb(229, 229, 229)');
                            /* Insert current row */
                            //  _curRow.insertAfter('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:eq(0)').fadeOut(100).fadeIn(100);
                            _curRow.insertAfter('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:eq(0)');
                            /* change color of current row */
                            //  $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody').css('background-color', 'lime');
                            $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:eq(1) >td').css('background-color', 'lime');

                            var _trCur = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth').children().children()[1];
                            _brachName = _trCur.children[5].textContent.trim();
                            _itemName = _trCur.children[6].textContent.trim();
                            _bkNum = _trCur.children[2].textContent.trim();
                            $('#ctl00_ContentPlaceHolder1_lblStatusCloth').text(_itemName + ' [Order No:' + _bkNum + ', Store:' + _brachName + ']' + ' ' + findWorkShopRemark(_bkNum + '_' + _brachName));
                            jSuccess();
                            /* Remove the checkbox */
                            _curRow.find(':checkbox').attr('checked', false);
                            stateOfColor = true;
                            setDivMouseOver('#00aa00', '#999999');
                            /* stock recon like */
                            changeChallanStatus(1, '*' + _myVal + '*');
                        }
                        else if (_curRow.size() == 0) {
                            var _newRow = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody').find(':contains(' + '*' + _myVal + '*' + ')').closest('tr');
                            if (_newRow.size() == 1) {
                                // alert('Cloth Already Selected');
                                // $('#pnlPanel').dialog({ width: 250, modal: true });
                                stateOfColor = true;
                                setDivMouseOver('#FFA500', '#999999');
                                /* This will change previous colors */
                                //  $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr').filter(function () { return $(this).css('background-color') != 'transparent'; }).css('background-color', 'transparent');
                                $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr >td').filter(function () { return $(this).css('background-color') != 'rgb(229, 229, 229)'; }).css('background-color', 'rgb(229, 229, 229)');
                                //  _newRow.css('background-color', 'orange');
                                _newRow.find('td').css('background-color', 'orange');
                                _newRow.insertAfter('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:eq(0)');
                                var _trCur = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth').children().children()[1];
                                _brachName = _trCur.children[5].textContent.trim();
                                _itemName = _trCur.children[6].textContent.trim();
                                _bkNum = _trCur.children[2].textContent.trim();
                                $('#ctl00_ContentPlaceHolder1_lblStatusCloth').text(_itemName + ' [Order No:' + _bkNum + ', Store:' + _brachName + ']' + ' ' + findWorkShopRemark(_bkNum + '_' + _brachName));

                            }
                            else {
                                //alert('Cloth Not Available');
                                // $('#pnlPanel').dialog({ width: 250, modal: true });
                                $('#ctl00_ContentPlaceHolder1_lblStatusCloth').text('CLOTH NOT AVAILABLE');
                                jBeep();
                                //beepSound();
                                stateOfColor = true;
                                setDivMouseOver('#FF0000', '#999999');
                            }
                        }
                        $(this).val('');
                        $(this).focus();
                        setQtyInLabel();
                        disableSaveButtons();
                        return false;
                    }
                    $('#hdnAddedHeader').val('false');
                    $('#hdnRemovedEmptyMessage').val('false');
                    var _allRowsCount = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr').size();
                    // check if booking number exists or not
                    var bkExists = checkIfBookingExists($('#txtBarcode').val());
                    if (bkExists == false) {
                        //alert('This booking number is not available.');
                        $('#ctl00_ContentPlaceHolder1_lblStatusCloth').text('ORDER NOT AVAILABLE');
                        jBeep();
                        //beepSound();
                        stateOfColor = true;
                        setDivMouseOver('#FF0000', '#999999');
                        $('#txtBarcode').val('');
                        /**** set previous values *********/
                        return false;
                    }
                    $('#ctl00_ContentPlaceHolder1_drpProcess option:eq(0)').attr('Selected', true);
                    $('#ctl00_ContentPlaceHolder1_drpMulti option:eq(0)').attr('Selected', true);
                    $('#ctl00_ContentPlaceHolder1_txtHolidayDate').val('');

                    if (_allRowsCount > 1) {
                        // save the html of this grid, and on load, show it, also set the empty row removed and header copied to true
                        var _allHTMLToSave = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth').closest('div').html();
                        $('#pnlMsg').dialog({ width: 100, height: 120, modal: true });
                        __doPostBack('ctl00$ContentPlaceHolder1$txtBarcode', _allHTMLToSave);
                    }
                    else {
                        $('#pnlMsg').dialog({ width: 100, height: 120, modal: true });
                        __doPostBack('ctl00$ContentPlaceHolder1$txtBarcode', null);
                    }
                }
            });

            function LTRfunc(e) {
                if (e.isTrigger || e.target.type !== 'checkbox') { return; }
                if ($(e.target).closest('table').attr('id') === 'ctl00_ContentPlaceHolder1_grdNewChallan') {
                    var _rowNum, localRow, localRows;
                    if ($(e.target).is(':checked')) {
                        localRow = $(e.target).closest('tr').clone();
                        localRow.html(localRow.html().replace(/grdNewChallan/gi, 'grdSelectedCloth'));
                        if (window['LTR'] == null) {
                            window['LTR'] = localRow;
                            window['LTRRemove'] = $(e.target).closest('tr'); // this wil be null when the window['ltr'] is null
                        }
                        else {
                            window['LTR'] = window['LTR'].add(localRow);
                            window['LTRRemove'] = window['LTRRemove'].add($(e.target).closest('tr'));
                        }
                    }
                    else {
                        _rowNum = $(e.target).closest('tr').find('td:eq(4)').text(); // this gets the barcode so we can filter on that basis
                        _rowNum = _rowNum.trim();
                        window['LTR'] = window['LTR'].filter(function (i, v) { return $(v).find('td').eq(4).text() != _rowNum; });
                        window['LTRRemove'] = window['LTRRemove'].filter(function (i, v) { return $(v).find('td').eq(4).text() != _rowNum; });
                    }
                    disableButtons();
                    e.stopPropagation();
                }
            }



            function RTLfunc(e) {
                if (e.isTrigger || e.target.type !== 'checkbox') { return; }
                if ($(e.target).closest('table').attr('id') === 'ctl00_ContentPlaceHolder1_grdSelectedCloth') {
                    var _rowNum, localRow, localRows;
                    if ($(e.target).is(':checked')) {
                        localRow = $(e.target).closest('tr').clone();
                        localRow.html(localRow.html().replace(/grdSelectedCloth/gi, 'grdNewChallan'));
                        if (window['RTL'] == null) {
                            window['RTL'] = localRow;
                            window['RTLRemove'] = $(e.target).closest('tr'); // this wil be null when the window['ltr'] is null
                        }
                        else {
                            window['RTL'] = window['RTL'].add(localRow);
                            window['RTLRemove'] = window['RTLRemove'].add($(e.target).closest('tr'));
                        }
                    }
                    else {
                        _rowNum = $(e.target).closest('tr').find('td:eq(4)').text(); // this gets the barcode so we can filter on that basis
                        _rowNum = _rowNum.trim();
                        window['RTL'] = window['RTL'].filter(function (i, v) { return $(v).find('td').eq(4).text() != _rowNum; });
                        window['RTLRemove'] = window['RTLRemove'].filter(function (i, v) { return $(v).find('td').eq(4).text() != _rowNum; });
                    }
                    disableButtons();
                    e.stopPropagation();
                }
            }



            /********** OLD CODE ***********/
            $('.DivStyleWithScroll').eq(0).on('click', /* ':checkbox', */function (e) {
                setTimeout(function (arg) { LTRfunc(arg) }, 10, e);
            });


            /******** OLD CODE *******/
            $('.DivStyleWithScroll').eq(1).on('click', /* ':checkbox', */function (e) {
                setTimeout(function (arg) { RTLfunc(arg) }, 10, e);
            });

            function makeMoveAll() {

            }
            function makeMoveLTR() {
                window['LRTAll'] = $('#ctl00_ContentPlaceHolder1_grdNewChallan tr').not(':eq(0)').clone();
                window['LRTAll'].each(function (i, v) { $(v).html($(v).html().replace(/grdNewChallan/gi, 'grdSelectedCloth')); });
                window['LRTAllRemove'] = $('#ctl00_ContentPlaceHolder1_grdNewChallan tr').not(':eq(0)');
            }

            function makeMoveRTL() {
                window['RTLAll'] = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth tr').not(':eq(0)').clone();
                window['RTLAll'].each(function (i, v) { $(v).html($(v).html().replace(/grdSelectedCloth/gi, 'grdNewChallan')); });
                window['RTLAllRemove'] = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth tr').not(':eq(0)');
            }

            // this finds the workshop remarks, added later
            function findWorkShopRemark(orderNumber) {
                var _result = '';
                $.ajax({
                    url: '../Autocomplete.asmx/findWorkShopRemark',
                    data: "bookingNumber='" + orderNumber + "'",
                    type: 'GET',
                    datatype: 'JSON',
                    contentType: 'application/json; charset=utf8',
                    async: false,
                    timeout: 1000,
                    success: function (result) { _result = result.d; },
                    error: function () { alert('Well! You are screwed!'); }
                });
                return _result;
            }

            /********** the buttons *************/

            var moveRight = function (event) {
                // find the checked ones and move them to right
                event.preventDefault();
                var _grdSize = $('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr').size();
                var _i = '';
                var _k = 1;
                // if 0, its the first one, start is from 1 and end at the value               

                if ($('#hdnAddedHeader').val() == 'false') {
                    /* DivStyleWithScroll').eq(1).find('table').remove();
                    var tbl = '<table cellspacing="0" border="1" style="width:40%;border-collapse:collapse;" id="ctl00_ContentPlaceHolder1_grdSelectedCloth" rules="all" class="mGrid"><tbody><tr style="color:White;font-size:Small;"><th style="width:2%;" scope="col"><span id="ctl00_ContentPlaceHolder1_grdNewChallan_ctl01_Label1"></span</th><th style="display: none" scope="col"><span id="ctl00_ContentPlaceHolder1_grdNewChallan_ctl01_Label2">RowNumber</span></th><th style="width:2px;" scope="col">Order</th><th style="width:5%;" scope="col">Due Date</th><th style="width:5%;" scope="col">Barcode</th><th style="width:5%;" scope="col">Customer</th><th style="width:5%;" scope="col">Cloth</th><th style="width:2%;" scope="col">U</th><th style="width:5%;" scope="col">Service</th></tr></table>'
                    var jTbl = $(tbl);
                    $('.DivStyleWithScroll').eq(1).prepend(jTbl); */
                    $('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr:eq(0)').clone().insertAfter('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:first');
                    $('#hdnAddedHeader').val('true');
                }
                if ($('#hdnRemovedEmptyMessage').val() == 'false') {
                    $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:eq(0)').remove();
                    $('#hdnRemovedEmptyMessage').val('true');
                }
                window['LTR'].insertAfter('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:eq(0)');
                window['LTRRemove'].remove();
                setQtyInLabel();
                changeChallanStatus(1, null, 'ctl00_ContentPlaceHolder1_grdSelectedCloth');
                $('#txtBarcode').focus();
                window['LTR'] = null;
                window['RTL'] = null;
                return false;
            };
            //$('#btnMoveRight').on('click', moveRight);

            /********** the buttons *************/

            var moveLeft = function (event) {
                // find the checked ones and move them to right
                event.preventDefault();
                var _grdSize = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr').size();
                var _i = '';
                var _k = 1;


                setLeftGridHeaders();
                window['RTL'].insertAfter('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr:eq(0)');
                window['RTLRemove'].remove();
                setQtyInLabel();
                changeChallanStatus(0, null, 'ctl00_ContentPlaceHolder1_grdNewChallan');
                $('#txtBarcode').focus();
                window['LTR'] = null;
                window['RTL'] = null;
                return false;
            };
            //$('#btnMoveLeft').on('click', moveLeft);

            /*********** btn move right all ***********/

            var moveRightAllHandler = function (event) {

                var _grdSize = $('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr').size();
                var _i = '';
                var _k = 1;


                if ($('#hdnAddedHeader').val() == 'false') {
                    $('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr:eq(0)').clone().insertAfter('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:first');
                    $('#hdnAddedHeader').val('true');
                }
                // first remove the empty text if not already removed
                if ($('#hdnRemovedEmptyMessage').val() == 'false') {
                    $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:eq(0)').remove();
                    $('#hdnRemovedEmptyMessage').val('true')
                }
                if ($('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr').size() > 1) {
                    //$('.DivStyleWithScroll').closest('table').block({ fadeIn: 0, overlayCSS: { backgroundColor: '#fff', opacity: 0} });
                    $('.form-signin4').block({ fadeIn: 0, overlayCSS: { backgroundColor: '#fff', opacity: 0} });
                    setTimeout(function () {
                        makeMoveLTR();
                        window['LRTAll'].insertAfter('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:eq(0)');
                        window['LRTAllRemove'].remove();
                        $('.form-signin4').unblock();
                        setQtyInLabel();
                        changeChallanStatus(1, null, 'ctl00_ContentPlaceHolder1_grdSelectedCloth');
                    }, 25);

                }
                else {
                    alert('No cloth available to move!');
                }
                setQtyInLabel();
                $('#txtBarcode').focus();
                window['LTR'] = null;
                window['RTL'] = null;
                return false;
            };
            if ($('#ctl00_ContentPlaceHolder1_grdNewChallan :checkbox').size() > 0) {
                $('#btnMoveRightAll').one('click', moveRightAllHandler);
            }

            function testRight() {
                //var result2 = document.getElementById('result2');
                //var start = new Date().getTime();
                var iCount = 0, limit = 200, busy = false;
                var processor = setInterval(function () {
                    if (!busy) {
                        busy = true;
                        /*result2.value = 'time=' +
                        (new Date().getTime() - start) + ' [i=' + i + ']';
                        process();*/
                        moveRightAll();
                        if (++iCount == limit) {
                            clearInterval(processor);
                            /*result2.value = 'time=' +
                            (new Date().getTime() - start) + ' [done]';*/
                        }
                        busy = false;
                        if ($('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr').size() == 1) {
                            clearInterval(processor);
                            processor = null;
                            $('#ctl00_ContentPlaceHolder1_grdSelectedCloth :checked').each(function (index) { $(this).attr('checked', false); });
                            $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:eq(1)').insertAfter('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr:eq(0)');
                            setQtyInLabel();
                            $('.DivStyleWithScroll').closest('table').unblock();
                        }
                    }
                }, 100);
            }

            function moveRightAll() {
                var _k = 1;
                for (_i = 1; _i < 500; _i++) {
                    // now copy this row over
                    $('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr:eq(' + _i + ')').insertAfter('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:eq(0)');
                    // check it
                    _k++;
                    _i = _i - 1;
                    if (_k == 500)
                        break;
                }
            }

            /*********** btn move left all ***********/

            var moveLeftAllHandler = function (event) {
                // find the checked ones and move them to right
                var _grdSize = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr').size();
                var _i = '';
                var _k = 1;

                var _grdSize = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr').size();
                var _i = '';
                var _k = 1;
                setLeftGridHeaders();
                if ($('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr').size() > 1) {
                    // $('.DivStyleWithScroll').closest('table').block({ fadeIn: 0, overlayCSS: { backgroundColor: '#fff', opacity: 0} });
                    $('.form-signin4').block({ fadeIn: 0, overlayCSS: { backgroundColor: '#fff', opacity: 0} });
                    setTimeout(function () {
                        makeMoveRTL();
                        window['RTLAll'].insertAfter('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr:eq(0)');
                        window['RTLAllRemove'].remove();
                        $('.form-signin4').unblock();
                        setQtyInLabel();
                        changeChallanStatus(0, null, 'ctl00_ContentPlaceHolder1_grdNewChallan');
                    }, 25);
                }
                else {
                    alert('No cloth available to move!');
                }
                setQtyInLabel();
                $('#txtBarcode').focus();
                window['LTR'] = null;
                window['RTL'] = null;
                return false;
            };
            if ($('#ctl00_ContentPlaceHolder1_grdSelectedCloth :checkbox').size() > 0) {
                $('#btnMoveLeftAll').one('click', moveLeftAllHandler);
            }

            function testLeft() {
                //var result2 = document.getElementById('result2');
                //var start = new Date().getTime();
                var iCount = 0, limit = 200, busy = false;
                var processor2 = setInterval(function () {
                    if (!busy) {
                        busy = true;
                        /*result2.value = 'time=' +
                        (new Date().getTime() - start) + ' [i=' + i + ']';
                        process();*/
                        moveLeftAll();
                        if (++iCount == limit) {
                            clearInterval(processor2);
                            /*result2.value = 'time=' +
                            (new Date().getTime() - start) + ' [done]';*/
                        }
                        busy = false;
                        if ($('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr').size() == 1) {
                            clearInterval(processor2);
                            processor2 = null;
                            $('#ctl00_ContentPlaceHolder1_grdNewChallan :checked').each(function (index) { $(this).attr('checked', false); });
                            setQtyInLabel();
                            $('.DivStyleWithScroll').closest('table').unblock();
                        }
                    }
                }, 100);
            }

            function moveLeftAll() {
                var _k = 1;
                for (_i = 1; _i < 500; _i++) {
                    // now copy this row over
                    $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:eq(' + _i + ')').insertAfter('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr:eq(0)');
                    //$('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr:eq(' + _i + ')').insertAfter('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:last');
                    // check it
                    _k++;
                    _i = _i - 1;
                    if (_k == 500)
                        break;
                }
            }

            // Button Delete
            $('#btnDeleteAll').click(function (e) {
                $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:not(:first)').remove();
                $('#hdnAddedHeader').val('false');
                $('#hdnRemovedEmptyMessage').val('false');
                $('#hdnAllRowMoveNumFromLTR').val('');
                $('#hdnAllRowMoveNumFromRTL').val('');
                $('#hdnLTRPrevCount').val('');
                $('#hdnRTLPrevCount').val('');
                $('#txtBarcode').focus();
                return false;
            });


            function setLeftGridHeaders() {
                if ($('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr').length === 1) {
                    $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:eq(0)').clone().insertAfter('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr:first');
                    $('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr:eq(0)').remove();
                }
            }

            function setGridColor(grdID, colorValue, startRow, EndRow, rowToStepOver) {
                var _grdId = $('#' + grdID);
                for (var i = startRow; i <= EndRow; i++) {
                    $('#' + grdID + ' > tbody > tr:eq(' + i + ')').css('background-color', colorValue);
                }
            }

            function setQtyInLabel() {
                var _prvVal = $('#lblQtyCount').text();
                var _qtyCount = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr').size() - 1;
                if (parseInt(_qtyCount) < 0) {
                    _qtyCount = 0;
                }
                $('#lblQtyCount').text(_qtyCount);
                //setQtyInFirstGrid();
                setQtyInLeftLabel();
                disableButtons();
                disableSaveButtons();
            }

            function setQtyInLeftLabel() {
                var _prvVal = $('#lblLeft').text();
                var _qtyCount = $('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr').size() - 1;
                if (parseInt(_qtyCount) < 0) {
                    _qtyCount = 0;
                }
                $('#lblLeft').text(_qtyCount);
            }

            function setcolorOfDiv(argColor) {
                //$('#DivContainerStatus, #DivContainerStatus > div').css('background-color', argColor);
            }

            function setDivMouseOver(argColorOne, argColorTwo) {
                if (stateOfColor) {
                    // label-success
                    $('#DivContainerStatus > div').animate({ 'background-Color': argColorOne }, 500).delay(1000).animate({ 'background-Color': argColorTwo }, 100);
                    //$('#DivContainerStatus').closest('td').animate({ backgroundColor: argColorTwo }, 1000);
                    //$('#DivContainerStatus > div').addClass('label-success').delay('1000').removeClass('label-success');
                }
                else {
                    $('#DivContainerStatus, #DivContainerStatus > div').animate({ backgroundColor: argColorTwo }, 10000);
                    $('#DivContainerStatus, #DivContainerStatus > div').animate({ backgroundColor: argColorOne }, 10000);
                }
                stateOfColor = !stateOfColor;
            }

            function setQtyInFirstGrid() {
                if ($('#ctl00_ContentPlaceHolder1_grdNewChallan').find('tr').last().css('background-color') == 'rgb(173, 255, 47)') {
                    if (!$('#ctl00_ContentPlaceHolder1_grdNewChallan').find('tr').last().is(':visible')) {
                        $('#ctl00_ContentPlaceHolder1_grdNewChallan').find('tr').last().show();
                    }
                    if ($('#ctl00_ContentPlaceHolder1_grdNewChallan').find('tr').last().find('td:eq(2)').text() == 'Total') {
                        var _cnt = $('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr').size() - 2;
                        $('#ctl00_ContentPlaceHolder1_grdNewChallan').find('tr').last().find('td:eq(3)').text(_cnt);
                        return false;
                    }
                }
                else if (_bkFooterRowGridNew != '' && _bkFooterRowGridNew != null && _bkFooterRowGridNew != 'undefined') {
                    var tm = $('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr').last();
                    _bkFooterRowGridNew.insertAfter(tm);
                    setQtyInFirstGrid();
                    return false;
                }
            }

            function removeRedundantRowsFromGrid(grdToRemoveFrom, grdToCheckFrom, colTextToSearchFor, boolRemove) {
                $('#' + grdToCheckFrom + ' > tbody > tr > td:nth-child(' + colTextToSearchFor + ')').each(function (index) {
                    var _txt = $(this).text();
                    var _tm = $('#' + grdToRemoveFrom + '').find(':excontains(' + _txt + ')').closest('tr');
                    if (boolRemove) {
                        _tm.remove();
                    }
                });
                setQtyInLabel();
            }

            //            $('a, #ctl00_btnF1, #ctl00_btnF4, #btnDelivery').not('#btnSave, #btnRefresh').click(function (e) {
            //                var _allRowsCount = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr').size();
            //                if (_allRowsCount > 1 && e.clientX != 0 && e.clientY != 0) {
            //                    jBeep();
            //                    return confirm("You have selected few cloths but not submitted to print packing stickers. \nClick CANCEL to continue Printing,  Click OK to Leave Anyway");
            //                }
            //            });

            $('#btnSave, #btnRefresh, #btnTemp').click(function (e) {
                if (e.clientX == 0 || e.clientY == 0) {
                    return false;
                }
            });

            function checkIfBookingExists(argBookingNumber) {
                var result = '';
                $.ajax({
                    url: '../Autocomplete.asmx/CheckBookingNumberInFactory',
                    data: "bookingNumber='" + argBookingNumber + "'",
                    type: 'GET',
                    datatype: 'JSON',
                    contentType: 'application/json; charset=utf8',
                    async: false,
                    timeout: 5000,
                    success: function (response) {
                        result = response.d;
                    },
                    error: function (response) {
                        result = 'false';
                    }
                });
                return result;
            }


            function changeChallanStatus(status, barcode, gridId) {
                var allBarCodes = '';
                if (barcode == null) {
                    $('#' + gridId + ' td:nth-child(5)').each(function (i, v) { allBarCodes += this.textContent + ','; });
                    if (allBarCodes.length > 0) {
                        allBarCodes = allBarCodes.substr(0, allBarCodes.length - 1);
                    }

                }
                else {
                    allBarCodes = barcode;
                }

                $.ajax({
                    url: '../Autocomplete.asmx/ChangeChallanStatusForWorkshopPrintSticker',
                    data: "{barCodes: '" + allBarCodes + "', challanStatus: '" + status + "'}",
                    type: 'POST',
                    datatype: 'JSON',
                    contentType: 'application/json; charset=utf8',
                    async: true,
                    success: function (response) {
                        result = response.d;
                    },
                    error: function (response) {
                        //  alert(response.d);
                    }
                });

            }


            function disableButtons() {
                var _leftSize = $('#ctl00_ContentPlaceHolder1_grdNewChallan').find(':checked').size();
                var _rightSize = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth').find(':checked').size()
                /* LEFT BUTTON */
                if (_leftSize == 0) {
                    $('#btnMoveRight').attr('disabled', true).off('click');
                }
                else {
                    $('#btnMoveRight').attr('disabled', true).off('click');
                    $('#btnMoveRight').attr('disabled', false).one('click', moveRight);
                }
                /* RIGHT BUTTON */
                if (_rightSize == 0) {
                    $('#btnMoveLeft').attr('disabled', true).off('click');
                }
                else {
                    $('#btnMoveLeft').attr('disabled', true).off('click');
                    $('#btnMoveLeft').attr('disabled', false).one('click', moveLeft);
                }
                disableMoveAllButtons();
            }

            function disableMoveAllButtons() {
                if ($('#ctl00_ContentPlaceHolder1_grdNewChallan :checkbox').size() <= 0) {
                    $('#btnMoveRightAll').attr('disabled', true).off('click');
                }
                else {
                    $('#btnMoveRightAll').attr('disabled', true).off('click');
                    $('#btnMoveRightAll').attr('disabled', false).one('click', moveRightAllHandler);
                }
                if ($('#ctl00_ContentPlaceHolder1_grdSelectedCloth :checkbox').size() <= 0) {
                    $('#btnMoveLeftAll').attr('disabled', true).off('click');
                }
                else {
                    $('#btnMoveLeftAll').attr('disabled', true).off('click');
                    $('#btnMoveLeftAll').attr('disabled', false).one('click', moveLeftAllHandler);
                }
            }

            function disableSaveButtons() {
                var _rightSize = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr').size();
                var _toggle = false;
                if (_rightSize <= 1) {
                    $('#btnSave').attr('disabled', true).off('click'); ;
                }
                else {
                    $('#btnSave').attr('disabled', false).on('click', btnSaveClickHandler); ;
                }
            }

         //   var btnSaveClickHandler = function (e) {
            function btnSaveClickHandler() {               
                if ($('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr').size() <= 1) {
                    alert('No cloth selected to save!');
                    return false;
                }
                else {
                    // make the array
                    makeTheArrayToStore();
                    PackingStickerData();
                    // __doPostBack('ctl00$ContentPlaceHolder1$btnSave', null);
                }
            };

            function PackingStickerData() {
                var t3 = $('#drpPrintStartFrom').val();
                $.ajax({
                    url: '../AutoComplete.asmx/WorkShopPackingSticker',
                    data: "{possition: '" + t3 + "'}",
                    type: 'POST',
                    timeout: 20000,
                    contentType: 'application/json; charset=UTF-8',
                    datatype: 'JSON',
                    cache: true,
                    async: false,
                    success: function (response) {
                        var result = response.d;
                        if (result === 'Record Saved') {

                            BlankGrid();
                            window.open('../Bookings/printlabel1.aspx?DirectPrint=true&CloseWindow=true&RedirectBack=../Factory/frmPackingSticker.aspx');                                                   
                        }
                    },
                    error: function (response) {
                        alert(response.toString())
                    }
                });
            }


            function BlankGrid() {
                stateOfColor = true;
                setDivMouseOver('#00aa00', '#999999');
                MoveLeftAllData();
                $('#ctl00_ContentPlaceHolder1_grdSelectedCloth').closest('div').html('<table class="mgrid" rules="all" id="ctl00_ContentPlaceHolder1_grdSelectedCloth" style="border-collapse:collapse;" cellspacing="0" border="1"><tbody><tr><td colspan="9">There are no pending Cloths to generate packing stickers.</td></tr></tbody></table>');
                $('#hdnRemovedEmptyMessage').val('false');
                $('#hdnAddedHeader').val('false');
                window['LTR'] = null;

                setQtyInLabel();
                disableSaveButtons();
                $('#txtBarcode').focus();
            }
            function MoveLeftAllData() {
                if ($('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr').size() > 1) {

                    makeMoveRTL()
                    window['RTLAll'].insertAfter('#ctl00_ContentPlaceHolder1_grdNewChallan > tbody > tr:eq(0)');
                    window['RTLAllRemove'].remove();
                }
                else {
                    alert('No cloth available to move!');
                }
            }

            $('#btnRefresh').click(function (e) {
                __doPostBack('ctl00$ContentPlaceHolder1$btnRefresh', null);
            });

            function makeTheArrayToStore() {
                var _rowData = '';
                var _bid = '';
                var _grdSize = $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr').size();
                for (var _i = 1; _i < _grdSize; _i++) {
                    // first the booking number
                    _rowData += $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:eq(' + _i + ') > td:eq(2)').text() + ':';
                    // now the item serial number
                    _rowData += $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:eq(' + _i + ') > td:eq(4)').text().split('-')[1] + ':';
                    // subItem name
                    _rowData += $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:eq(' + _i + ') > td:eq(6) > span').text() + ':';
                    // now the branch id
                    _rowData += $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:eq(' + _i + ') > td:eq(4)').text().split('-')[2] + ':';
                    // now the urgent
                    _rowData += $('#ctl00_ContentPlaceHolder1_grdSelectedCloth > tbody > tr:eq(' + _i + ') > td:eq(7) > span').text() + ':';
                    // now add a '_' to separate rows
                    _rowData += '_';
                }
                _rowData = _rowData.substr(0, _rowData.length - 1);
                $('#hdnAllData').val(_rowData);
                return true;
            }

        });
    </script>
</asp:Content>