<%@ Page Title="" Language="C#" MasterPageFile="~/StoreMain.Master" AutoEventWireup="true"
    CodeBehind="frmDelivery.aspx.cs" Inherits="QuickWeb.Bookings_New.frmDelivery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .Table
        {
            margin-bottom: 0px;
        }
        .Table tr td
        {
            font-size: 14px;
            padding-top: 10px !important;
            padding-bottom: 10px !important;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="divShowMsg" class="row-fluid col-sm-12 Textpadding" style="display: none;">
        <div id="DivContainerStatus">
            <div id="DivContainerInnerStatus" class="span label label-default">
                <h4 class="text-center">
                    <asp:Label ID="lblMsg" runat="server" EnableViewState="False" Font-Bold="True" ForeColor="White"
                        ClientIDMode="Static" />
                </h4>
            </div>
        </div>
    </div>
    <div class="panel panel-primary well-sm-tiny1">
        <div class="panel-body well-sm-2">
            <div class="row-fluid col-sm-12 Textpadding">
                <div class="row-fluid DivLayer">
                    &nbsp;<i class="fa fa-user imgColor"></i>&nbsp;<asp:Label ID="lblCustomerName" Font-Bold="true"
                        Font-Size="15px" runat="server" ClientIDMode="Static"></asp:Label>
                    &nbsp;&nbsp;<i class="fa fa-building-o imgColor"></i>&nbsp;&nbsp;<asp:Label ID="lblCustAddress"
                        runat="server" ClientIDMode="Static"></asp:Label>
                    &nbsp;&nbsp;<i class="fa fa-mobile fa-lg imgColor"></i>&nbsp;&nbsp;<asp:Label ID="lblCustMobile"
                        runat="server" ClientIDMode="Static"></asp:Label>
                    &nbsp;&nbsp; <i class="fa fa-envelope-o imgColor"></i>&nbsp;&nbsp;<asp:Label ID="lblEmail"
                        runat="server" ClientIDMode="Static"></asp:Label>
                    &nbsp;&nbsp;<span class="pull-right"> <i class="fa fa-calendar imgColor "></i>&nbsp;&nbsp;
                    Last visit&nbsp;<asp:Label
                        ID="lblLastVisit" runat="server" ClientIDMode="Static"></asp:Label>&nbsp;</span>
                </div>
                <div class="row-fluid well well-sm-2 no-bottom-margin">
                    <div class="col-sm-3 Textpadding" style="background-color: White">
                        &nbsp; <span style="font-size: 14px">Order&nbsp;-&nbsp;<asp:Label ID="lblOrderDate"
                            runat="server" ClientIDMode="Static">17 Nov 2014</asp:Label></span> &nbsp;&nbsp;&nbsp;<span
                                style="font-size: 14px">Due&nbsp;-&nbsp;<asp:Label ID="lblDueDate" runat="server"
                                    ClientIDMode="Static">20 Nov 2014</asp:Label></span>
                    </div>
                    <div class="col-sm-9 Textpadding">
                        <div class="pull-right" style="background-color: White;">
                            &nbsp; Gross &nbsp;<asp:Label ID="lblGrossAmount" runat="server" Font-Bold="true"
                                ClientIDMode="Static">Rs. 1500</asp:Label>
                            &nbsp;<asp:Label ID="lblDiscount" runat="server" ClientIDMode="Static">less  Discount (@ 10 %) Rs. 50</asp:Label>
                            &nbsp;&nbsp; Net&nbsp;=&nbsp;<asp:Label ID="lblNetAmount" runat="server" Font-Bold="true"
                                ClientIDMode="Static">1500</asp:Label>&nbsp;&nbsp; <span style="color: green; font-size: 16px">
                                    Paid&nbsp;=&nbsp;<asp:Label ID="lblPaidAmount" Font-Bold="true" runat="server" ClientIDMode="Static">500</asp:Label>&nbsp;&nbsp;
                                </span><span style="color: Red; font-size: 16px">Due&nbsp;=&nbsp;<asp:Label ID="lblDueAmount"
                                    Font-Bold="true" runat="server" ClientIDMode="Static">500</asp:Label>&nbsp;&nbsp;
                                </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row-fluid div-margin">
                <div class="col-sm-2    ">
                    <div style="margin-top: -9px; text-align: center">
                        <asp:Label ID="lblInvoiceNo" runat="server" Font-Size="32px" Width="150px" Font-Bold="true"
                            ForeColor="#74848c" ClientIDMode="Static">K17442</asp:Label>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="input-group">
                        <span class="input-group-addon IconBkColor"><i class="fa fa-download fa-lg imgColor">
                        </i></span>
                        <asp:TextBox ID="txtBarcode" runat="server" MaxLength="20" CssClass="form-control"
                            ClientIDMode="Static" placeholder="Select cloth by barcode"></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="input-group">
                        <span class="input-group-addon IconBkColor">Total </span>
                        <asp:TextBox ID="txtTotalGarment" runat="server" disabled="true" ForeColor="#838383"
                            ClientIDMode="Static" Font-Bold="true" CssClass="form-control fontsize16"></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="input-group">
                        <span class="input-group-addon IconBkColor">Delivered</span>
                        <asp:TextBox ID="txtDelQty" runat="server" ForeColor="#838383" disabled="true" Text="0"
                            ClientIDMode="Static" Font-Bold="true" CssClass="form-control fontsize16"></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="input-group">
                        <span class="input-group-addon IconBkColor">Selected</span>
                        <asp:TextBox ID="txtSelectedGrament" ClientIDMode="Static" ForeColor="#838383" runat="server"
                            disabled="true" Text="0" Font-Bold="true" CssClass="form-control fontsize16"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row-fluid div-margin3">
                <div class="col-sm-12 nopaddingright">
                    <div style="border: 1px #cccccc solid; height: 330px; overflow: auto" class="whiteBkColor">
                        <asp:GridView ID="grdData" runat="server" EmptyDataText="No record found." HeaderStyle-CssClass="FixedHeader"
                            AutoGenerateColumns="false" ClientIDMode="Static" CssClass="Table Table-bordered1 Table-hover1"
                            EnableTheming="false">
                            <Columns>
                                <asp:TemplateField FooterStyle-BackColor="#E4E4E4" HeaderText="All">
                                    <HeaderTemplate>
                                        <div id="divChkAll" class="dijitInline dijitCheckBox">
                                            <asp:CheckBox ID="CheckAll" runat="server" onclick="SelectAllCheckboxes1(this);"
                                                ClientIDMode="Static" CssClass="dijitRt dijitCheckBoxInput " />
                                        </div>                                      
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <div id="divChk" class="dijitInline dijitCheckBox">
                                            <asp:CheckBox ID="chkSelect" runat="server" CssClass="dijitRt dijitCheckBoxInput "
                                                ClientIDMode="Static" />
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Garment Details">
                                    <ItemTemplate>
                                        <asp:Label ID="lblGarmentDetails" CssClass="pull-left" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                                        <span class="pull-right">
                                            <asp:Label ID="lblRemark" Font-Italic="true" Font-Size="12px" runat="server" Text='<%# Bind("ItemRemarks") %>'></asp:Label>
                                            <asp:Label ID="lblColor" runat="server" ForeColor="#46a3ff" Font-Size="12px" Text='<%# Bind("colour") %>'></asp:Label>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="BarCode" HeaderText="Barcode" />
                                <asp:BoundField DataField="ItemProcessType" HeaderText="Service" />
                                <asp:BoundField DataField="DeliverItemStaus" HeaderText="Status" />
                                <asp:TemplateField HeaderText="Ready On">
                                    <ItemTemplate>
                                        <asp:Label ID="lblReadyDate" runat="server" Text='<%# Bind("ReadyOn") %>'></asp:Label>
                                        <asp:Label ID="lblReadyTime" runat="server" Text='<%# Bind("ReadyTime") %>' Font-Size="11px"></asp:Label>
                                        <asp:Label ID="lblReadyUserName" Font-Italic="true" runat="server" Text='<%# Bind("ReadyUser") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delivered On">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDelDate" runat="server" Text='<%# Bind("DeliveredOn") %>'></asp:Label>
                                        <asp:Label ID="lblDelTime" runat="server" Text='<%# Bind("DeliveredTime") %>' Font-Size="11px"></asp:Label>
                                        <asp:Label ID="lblDelUserName" Font-Italic="true" runat="server" Text='<%# Bind("DeliveredUser") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle Font-Size="14px" CssClass="headerClass" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="row-fluid div-margin">
                <div class="col-sm-6 nopaddingright">
                    <div class="form-inline">
                        <div class="form-group">
                            <ul class="brands no-bottom-margin">
                                <li>
                                    <label class="checkbox" href="#">
                                        <input type="checkbox" id="chkSMS" runat="server" clientidmode="Static"/>
                                        <span>SMS<br />
                                            NOTIFY</span>
                                    </label>
                                </li>
                            </ul>
                        </div>
                        <div class="form-group divMarginLeft">
                            <ul class="brands no-bottom-margin">
                                <li>
                                    <label class="checkbox" href="#">
                                       <input type="checkbox" id="chkEmail" runat="server" clientidmode="Static"/>
                                        <span>EMAIL<br />
                                            NOTIFY</span>
                                    </label>
                                </li>
                            </ul>
                        </div>
                        <div class="form-group divMarginLeft">
                            <ul class="brands no-bottom-margin">
                                <li>
                                    <label class="checkbox" href="#">
                                         <input type="checkbox" id="chkSatisfiedCustomer" runat="server" clientidmode="Static"/>
                                        <span>SATISFIED<br />
                                            CUSTOMER</span>
                                    </label>
                                </li>
                            </ul>
                        </div>
                        <div class="form-group divMarginLeft">
                            <ul class="brands no-bottom-margin">
                                <li>
                                    <label class="checkbox" href="#">
                                       <input type="checkbox" id="chkDeliveryWithoutTicket" runat="server" clientidmode="Static"/>
                                        <span>DELIVERED</br><span class="lineTop">WO</span>&nbsp;TICKET</span>
                                    </label>
                                </li>
                            </ul>
                        </div>
                        <div class="form-group divMarginLeft">
                            <ul class="brands no-bottom-margin">
                                <li>
                                    <asp:TextBox ID="txtNotes" runat="server" Rows="2" Font-Size="Large" Height="82px"
                                        EnableTheming="false" ClientIDMode="Static" Style="margin-top: -5px" Width="170px"
                                        TextMode="MultiLine" CssClass="form-control" placeholder="Notes  . . ."></asp:TextBox>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 Textpadding">
                    <div class="pull-right">
                        <asp:LinkButton ID="btnSave" class="btn btn-default active btn-buttoncss" runat="server"
                            EnableTheming="false">CUSTOMER<br /> DETAILS</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton1" class="btn btn-default active  btn-buttoncss divMarginLeft btnClass1"
                            runat="server" EnableTheming="false" Height="79px">EXIT</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" class="btn btn-default active  btn-buttoncss divMarginLeft"
                            runat="server" EnableTheming="false">PRINT RECEIPT<br /> WITH AMOUNT</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton3" class="btn btn-default active  btn-buttoncss divMarginLeft"
                            runat="server" EnableTheming="false">PRINT RECEIPT<br /> <span class="lineTop">WO</span> AMOUNT</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton4" class="btn btn-primary btn-buttoncss divMarginLeft"
                            runat="server" EnableTheming="false">DELIVER AND<br /> ACCEPT PAYMENT</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../js/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../JavaScript/ScrollableGridPlugin.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">

        $(document).ready(function () {

            $('#grdData').Scrollable({
                ScrollHeight: 278
            });


            $('#txtBarcode').keydown(function (event) {

                if (event.which == 13 || event.which == 9) {
                    var _myVal = $(this).val().toUpperCase();
                    if (_myVal.indexOf('-') != -1) {
                        var _curRow = $('#grdData > tbody').find(':contains(' + '*' + _myVal + '*' + ')').closest('tr');
                        if (_curRow.size() == 1) {
                            if (_curRow.find('input:checkbox').is(':checked')) {

                                setDivMouseOver('#FA8602', '#999999');
                                $('#lblMsg').text('Garment is already selected.');
                            }
                            else {
                                $(':checkbox', _curRow).trigger('click');
                            }
                        }
                        else {
                            setDivMouseOver('Red', '#999999');
                            $('#lblMsg').text('Garment not available.');
                        }
                    }
                    $(this).val('');
                    $(this).focus();
                    return false;

                }
            });

            $('#grdData tr').click(function (event) {
                if (event.target.type !== 'checkbox') {
                    $(':checkbox', this).trigger('click');
                }
            });
            $("#grdData input[type='checkbox']").change(function (e) {
                if ($(this).is(":checked")) {
                    $(this).closest('tr').addClass("selected_row");
                    $(this).closest('tr').find('#divChk').addClass("dijitCheckBoxChecked");
                } else {
                    $(this).closest('tr').removeClass("selected_row");
                    $(this).closest('tr').find('#divChk').removeClass("dijitCheckBoxChecked");
                }
                SetQty();
            });
        });
        function SelectAllCheckboxes1(chk) {


            if ($('#CheckAll').attr('checked')) {
                $('#divChkAll').addClass("dijitCheckBoxChecked");
            } else {
                $('#divChkAll').removeClass("dijitCheckBoxChecked");
            }


            $('#grdData').find("input:checkbox").each(function () {
                if (this != chk) {
                    this.checked = chk.checked;
                    if (chk.checked === true) {
                        $(this).closest('tr').addClass("selected_row");
                        $(this).closest('tr').find('#divChk').addClass("dijitCheckBoxChecked");
                    }
                    else {
                        $(this).closest('tr').removeClass("selected_row");
                        $(this).closest('tr').find('#divChk').removeClass("dijitCheckBoxChecked");
                    }
                }
            });

            SetQty();
        }

        function SetQty() {

            var numberOfChecked = $('#grdData input:checkbox:checked').length;
            $('#txtSelectedGrament').val(numberOfChecked);
        }

        function clearMsg() {
            $('#lblMsg').text('');
        }
        function setDivMouseOver(argColorOne, argColorTwo) {
            document.getElementById('divShowMsg').style.display = "inline";
            $('#DivContainerInnerStatus').css('backgroundColor', argColorOne);
            setTimeout(function () { $('#divShowMsg').fadeOut(3000); }, 4000);
        }

    </script>
</asp:Content>
