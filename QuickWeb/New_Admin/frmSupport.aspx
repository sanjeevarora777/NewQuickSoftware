<%@ Page Title="" Language="C#" MasterPageFile="~/StoreMain.Master" AutoEventWireup="true"
    CodeBehind="frmSupport.aspx.cs" Inherits="QuickWeb.New_Admin.frmSupport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/introjs.css" rel="stylesheet" type="text/css" />
    <link href="../css/loader.css" rel="stylesheet" type="text/css" />	
    <script src="../js/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/loader.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-sm-1">
    </div>
    <div class="col-sm-10">
        <div class="panel panel-default div-margin">
            <br />
            <div class="div-margin">
                <div class="row-fluid">
                    <div class="row-fluid">
                        <div class="col-sm-6" style="border-right: 1px solid #a4a4a4">
                            <div class="panel panel-default no-bottom-margin">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <i class="fa fa-desktop"></i>&nbsp;&nbsp;Remote support
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div class="row-fluid div-margin">
                                        <p>
                                            Stuck somewhere? Need help...start a free remote support session NOW.
                                        </p>
                                    </div>
                                    <br />
                                    <br />
                                    <div class="row-fluid div-margin textCenter">
                                        <asp:LinkButton ID="lnkRemortSupport" runat="server" class="btn btn-primary" OnClick="lnkRemortSupport_Click"><span class="textBold">Remote Support</span>&nbsp;
                                            <i class="fa fa-desktop"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="panel panel-default no-bottom-margin">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <i class="fa fa-phone fa-lg"></i>&nbsp;&nbsp;Phone and Email support
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div class="row-fluid div-margin">
                                        <div>
                                            We are here to serve you! Reach out to us through any of the following:</div>
                                        <div class="div-margin">
                                            <i class="fa fa-hand-o-right fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;<sapn style="font-size: 16px;
                                                font-weight: bold">+91 921 266 3156, +91 921 114 0404, +91 11 4555 8316</sapn>
                                            <br />
                                        </div>
                                        <div class="div-margin">
                                            <i class="fa fa-hand-o-right fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;<sapn style="font-size: 14px;
                                                font-weight: bold">
                                                <a href="mailto:support@quickdrycleaning.com">support@quickdrycleaning.com</a>
                                                </sapn>
                                            <br />
                                        </div>
                                        <div class="div-margin">
                                            Monday - Saturday | 10:00 am to 6:00 pm (IST)</div>
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="panel panel-default no-bottom-margin">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <i class="fa fa-video-camera"></i>&nbsp;&nbsp;Tutorials and Video
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div class="row-fluid">
                                        Select a tour to learn how to use software by following simple steps.
                                    </div>
                                    <div class="row-fluid div-margin">
                                        <a id="achrTour1"><span style="font-size: 17px" class="textBold">1. Add new customer
                                            and generate new order</span>&nbsp;&nbsp;<i class="fa fa-share"></i></a>
                                    </div>

                                     <div class="row-fluid div-margin">
                                        <a id="achrSupportTour"><span style="font-size: 17px" class="textBold">2. connect to support team for technical assistance</span>&nbsp;&nbsp;<i class="fa fa-share"></i></a>
                                    </div>

                                    <div class="row-fluid div-margin hometxtcolor">
                                        PS: new tours will be added soon.
                                        <br />
                                        <br />
                                       
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="panel panel-default no-bottom-margin">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <i class="fa fa-list"></i>&nbsp;&nbsp;Release Updates
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div class="row-fluid div-margin">
                                        <div class="textBold">
                                            <a href="frmReleaseNote.aspx?aid=1" target="_blank" id="achrRelease1">Version 14.11.5.4;
                                                Launched on: November 2014</a>
                                        </div>
                                        <div class="row-fluid">
                                            Introducing quick connection to support team, Menu items rearranged.
                                        </div>
                                        <br />
                                        <div class="textBold">
                                            <a href="frmReleaseNote.aspx?aid=2" target="_blank" id="achrRelease2">Version: 14.9.5.3;
                                                Launched on: September, 2014 </a>
                                        </div>
                                        <div class="row-fluid">
                                            Package system introduced, Track order editing history, Track login history, Enhancement
                                            in Multiple Payment & Delivery report.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />
        </div>
    </div>
    <asp:HiddenField runat="server" ID="hdnIsCloud" Value="0" ClientIDMode="Static" />
    <asp:Panel ID="pnlMsg" runat="server" Style="display:none" ClientIDMode="Static" >
			<asp:UpdatePanel ID="UpdatePanel1" runat="server">			
                   <ContentTemplate>
                <div style="margin-top: -10px">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="fa  textBold"> Please Wait..</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-spinner fa-spin fa-3x"></i>                  
                </div>
            </ContentTemplate>
		  </asp:UpdatePanel>
	</asp:Panel>
   
    <script src="../JavaScript/intro.js" type="text/javascript"></script>
    <script src="../JavaScript/AppTour.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        $(document).ready(function () {

            $("#ctl00_ContentPlaceHolder1_lnkRemortSupport").click(function () {
                if ($('#hdnIsCloud').val() != "1") {
                    $('#pnlMsg').dialog({ width: 100, height: 120, modal: true });
                }
            });


            $('#achrTour1').click(function () {
                window.open('../home.html?IsTour=1', '_self'); return false;
            });
            $('#achrSupportTour').click(function () {
                window.open('../home.html?IsSupportTour=1', '_self'); return false;
            });

            if (RegExp('IsSupportTour=1', 'gi').test(window.location.search)) {
                SupportTour();
            }
        });
    </script>
</asp:Content>
