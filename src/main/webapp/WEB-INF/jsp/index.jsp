<!DOCTYPE html>
<html lang="en">
<head>
<title id='Description'>This demo illustrates the basic
	functionality of the Grid plugin. The jQWidgets Grid plugin offers rich
	support for interacting with data, including paging, grouping and
	sorting.</title>
<meta name="description"
	content="JavaScript Grid with rich support for Data Filtering, Paging, Editing, Sorting and Grouping" />
<link rel="stylesheet" href="../../jqwidgets/styles/jqx.base.css"
	type="text/css" />
<link rel="stylesheet" type="text/css" href="../../style.css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1 maximum-scale=1 minimum-scale=1" />
<script type="text/javascript" src="../../scripts/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../../jqwidgets/jqxcore.js"></script>
<script type="text/javascript" src="../../jqwidgets/jqxdata.js"></script>
<script type="text/javascript" src="../../jqwidgets/jqxbuttons.js"></script>
<script type="text/javascript" src="../../jqwidgets/jqxscrollbar.js"></script>
<script type="text/javascript" src="../../jqwidgets/jqxmenu.js"></script>
<script type="text/javascript" src="../../jqwidgets/jqxcheckbox.js"></script>
<script type="text/javascript" src="../../jqwidgets/jqxlistbox.js"></script>
<script type="text/javascript" src="../../jqwidgets/jqxdropdownlist.js"></script>

<script type="text/javascript" src="../../jqwidgets/jqxgrid.js"></script>
<script type="text/javascript" src="../../jqwidgets/jqxgrid.sort.js"></script>
<script type="text/javascript" src="../../jqwidgets/jqxgrid.pager.js"></script>
<script type="text/javascript" src="../../jqwidgets/jqxwindow.js"></script>
<script type="text/javascript" src="../../jqwidgets/jqxinput.js"></script>
<script type="text/javascript" src="../../jqwidgets/jqxgrid.filter.js"></script>
<script type="text/javascript"
	src="../../jqwidgets/jqxgrid.selection.js"></script>
<script type="text/javascript" src="../../jqwidgets/jqxgrid.edit.js"></script>
<script type="text/javascript" src="../../scripts/demos.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var url = "../index/getStudents";
						// prepare the data
						var source = {
							datatype : "json",
							datafields : [ {
								name : 'studentCode',
								type : 'string'
							}, {
								name : 'studentName',
								type : 'string'
							}, {
								name : 'address',
								type : 'string'
							},
							 {
								name : 'dob',
								type : 'string'
							},
							 {
								name : 'gender',
								type : 'boolean'
							},
							 {
								name : 'className',
								type : 'string'
							},
							],

							id : 'studentID',
							url : url,
							deleterow : function(rowid, commit) {
								// synchronize with the server - send delete command
								$.ajax({
									dataType : 'json',
									cache : false,
									url : '/Students/Delete/5',
									type : "POST",
									success : function(data, status, xhr) {
										// delete command is executed.
										commit(true);
									},
									error : function(jqXHR, textStatus,
											errorThrown) {
										alert(jqXHR.statusText);
										commit(false);
									}
								});
							},
						};
						var cellsrenderer = function(row, columnfield, value,
								defaulthtml, columnproperties, rowdata) {
							
							//if(value===true) return 'Nam'
							if (value < 20) {
								return '<span style="margin: 4px; margin-top:8px; float: ' + columnproperties.cellsalign + '; color: #ff0000;">'
										+ value + '</span>';
							} else {
								return '<span style="margin: 4px; margin-top:8px; float: ' + columnproperties.cellsalign + '; color: #008000;">'
										+ value + '</span>';
							}
						}
						var dataAdapter = new $.jqx.dataAdapter(source, {
							downloadComplete : function(data, status, xhr) {
							},
							loadComplete : function(data) {

								console.log(data)
							},
							loadError : function(xhr, status, error) {

							}
						});

						// initialize jqxGrid
						$("#grid").jqxGrid({

							source : dataAdapter,
							theme : "dark",
							width : '100%',
							showfilterrow : true,
							filterable : true,
							pageable : true,
							autoheight : true,
							sortable : true,
							altrows : true,
							enabletooltips : true,
							editable : false,
							showtoolbar: true,
							showstatusbar: true,
							
							columns : [ {
								text : 'Student Code',
								columngroup : 'studentCode',
								datafield : 'studentCode',
								//filtertype : 'input',
								width : 120,
							}, {
								text : 'Student Name',
								columngroup : 'studentName',
								datafield : 'studentName',
								cellsalign : 'right',
								align : 'right',

								width : 150
							}, {
								text : 'Address',
								columngroup : 'address',
								datafield : 'address',
								align : 'right',
								cellsalign : 'right',
								cellsformat : 'c2',

								width : 150
							},{
								text : 'Dob',
								columngroup : 'dob',
								datafield : 'dob',
								cellsalign : 'right',
								align : 'right',

								width : 150
							},{
								text : 'Gender',
								columngroup : 'gender',
								datafield :'gender' ,
								cellsalign : 'right',
								align : 'right',
								cellsrenderer: function (row, columnfield, value, defaulthtml, columnproperties) {
				                      //var lastName = dataAdapter.records[row].lastname;
				                      if( dataAdapter.records[row].gender)
				                      return '<span style="margin: 4px; float: ' + columnproperties.cellsalign + ';"> MALE </span>';
				                      else return '<span style="margin: 4px; float: ' + columnproperties.cellsalign + ';"> FEMALE </span>';
				                  },
								width : 100
							}, 
							{
								text : 'ClassName',
								columngroup : 'className',
								datafield : 'className',
								cellsalign : 'right',
								align : 'right',

								width : 150
							},],

						});
						$("#addrowbutton").jqxButton();
						$("#deleterowbutton").jqxButton();
						$("#updaterowbutton").jqxButton();
						$("#deleterowbutton")
								.bind(
										'click',
										function() {

											var getselectedrowindexes = $(
													'#grid').jqxGrid(
													'getselectedrowindexes');
											if (getselectedrowindexes.length > 0) {
												// returns the selected row's data.
												var selectedRowData = $('#grid')
														.jqxGrid(
																'getrowdata',
																getselectedrowindexes[0]).uid;
											
												if (confirm("Do you want to delete")) {
													$
															.ajax({
																type : "POST",
																url : '/index/delete',
																data : {
																	lastrowkey : selectedRowData
																},
																success : function() {
																	location
																			.reload();
																}
															});
													console
															.log(selectedRowData);
												}
												return false;
												}
												
										});
						$("#addrowbutton").bind('click', function() {
							//editrow = row;
							var offset = $("#grid").offset();
							$("#popupWindow").jqxWindow({
								position : {
									x : parseInt(offset.left) + 60,
									y : parseInt(offset.top) + 60
								}
							});
							$("#popupWindow").jqxWindow('open');
						});
						// initialize the popup window and buttons.
						$("#popupWindow").jqxWindow({
							width : 250,
							height : 200,
							resizable : false,
							isModal : true,
							autoOpen : false,
							cancelButton : $("#Cancel"),
							modalOpacity : 0.01
						});
						$("#popupWindow").on('open', function() {
							// $("#firstName").jqxInput('selectAll');
						});

						$("#Cancel").jqxButton({
							theme : theme
						});
						$("#Save").jqxButton({
							theme : theme
						});
						$("#Save")
								.click(
										function() {
											var code = document
													.getElementById('Code').value;
											var name = document
													.getElementById('Name').value;
											var address = document
													.getElementById('Address').value;
											if (code.trim() != null && name.trim() != null
													&& address.trim() != null
													&& code.trim() != "" && name.trim() != ""
													&& address.trim() != "") {
												$.ajax({
													type : "POST",
													url : '/index/add',
													data : {
														code : code,
														name : name,
														address : address,
													},
													success : function() {
														location.reload();
													}
												});
											} else
												$('#error').html("all field must be filled");
										});
						$("#updaterowbutton")
								.bind(
										'click',
										function() {
											var getselectedrowindexes = $(
													'#grid').jqxGrid(
													'getselectedrowindexes');
											if (getselectedrowindexes.length > 0) {
												// returns the selected row's data.
												var selectedRowData = $('#grid')
														.jqxGrid(
																'getrowdata',
																getselectedrowindexes[0]);
												console.log(selectedRowData);
												$("#CodeUpdate")
														.val(
																selectedRowData.studentCode);
												$("#NameUpdate")
														.val(
																selectedRowData.studentName);
												$("#AddressUpdate")
														.val(
																selectedRowData.address);
												var offset = $("#grid")
														.offset();
												$("#popupWindowUpdate")
														.jqxWindow(
																{
																	position : {
																		x : parseInt(offset.left) + 60,
																		y : parseInt(offset.top) + 60
																	}
																});
												$("#popupWindowUpdate").jqxWindow(
												'open');
											}
	
											
										});
						$("#popupWindowUpdate").jqxWindow({
							width : 250,
							height :200,
							resizable : false,
							isModal : true,
							autoOpen : false,
							cancelButton : $("#CancelUpdate"),
							modalOpacity : 0.01
						});
						$("#popupWindowUpdate").on('open', function() {
							//$("#firstName").jqxInput('selectAll');
						});
						$("#CancelUpdate").jqxButton({
							theme : theme
						});
						$("#SaveUpdate").jqxButton({
							theme : theme
						});
						$("#SaveUpdate")
								.click(
										function() {
											var getselectedrowindexes = $(
													'#grid').jqxGrid(
													'getselectedrowindexes');
											var id;
											if (getselectedrowindexes.length > 0) {
												// returns the selected row's data.
												id = $('#grid')
														.jqxGrid(
																'getrowdata',
																getselectedrowindexes[0]).uid;
											}
											var code = document
													.getElementById('CodeUpdate').value;
											var name = document
													.getElementById('NameUpdate').value;
											var address = document
													.getElementById('AddressUpdate').value;
											console.log(code);
											if (code.trim() != null && name.trim() != null
													&& address.trim() != null
													&& code.trim() != "" && name.trim() != ""
													&& address.trim() != "") {
												$.ajax({
													type : "POST",
													url : '/index/update',
													data : {
														id : id,
														code : code,
														name : name,
														address : address,
													},
													success : function() {
														location.reload();
													}
												});
											} else
												$('#errorupdate').html("all field must be filled");
										});

						$('#clearfilteringbutton').jqxButton({
							height : 25
						});
						$('#clearfilteringbutton').click(function() {
							$("#grid").jqxGrid('clearfilters');
						});
						  $("#jqxcalendar").jqxCalendar({ width: '250px', height: '250px' });
				          $('#jqxcalendar').bind('valuechanged', function (event) {
				              var date = event.args.date;
				              $("#log").text(date.toDateString());
				          });
					});
</script>
</head>
<body class='default'>


	<div class="main">
		<div style="display: flex">
			<div style="margin-top: 10px;">
				<input id="addrowbutton" type="button" value="Add New Row" />
			</div>
			<div style="margin-top: 10px; margin-left: 5px;">
				<input id="deleterowbutton" type="button"
					value="Delete Selected Row" />
			</div>
			<div style="margin-top: 10px; margin-left: 5px;">
				<input id="updaterowbutton" type="button"
					value="Update Selected Row" />
			</div>
		</div>
		<div style="margin-top: 10px;" id="grid"></div>
		<div id="popupWindow" >
			<div>ADD</div>
			<div style="overflow: hidden;">
				<table>
					
					<tr>
						<td align="right">Code:</td>
						<td align="left"><input id="Code" /></td>
					</tr>
					<tr>
						<td align="right">Name:</td>
						<td align="left"><input id="Name" /></td>
					</tr>
					<tr>
						<td align="right">Address:</td>
						<td align="left"><input id="Address" /></td>
					</tr>
					<tr>
						<td align="right">DOB:</td>
						<td align="left"><div id='jqxcalendar'></div></td>
					</tr>
					<tr>
						<td align="right">Gender:</td>
						<td align="left"><input id="Gender" /></td>
					</tr>
					<tr>
						<td align="right">Class:</td>
						<td align="left"><input id="ClasName" /></td>
					</tr>
					
					<tr>
						<td align="right"></td>
						<td style="padding-top: 10px;" align="right"><input
							style="margin-right: 5px;" type="button" id="Save" value="Save" /><input
							id="Cancel" type="button" value="Cancel" /></td>
					</tr>
				</table>
				<div id="error" style = " color: #b00404; white-space: nowrap, margin-top:2px, margin-left:2px"></div>
			</div>
		</div>
		<input style="margin-top: 10px;" value="Remove Filter"
			id="clearfilteringbutton" type="button" />
		<div id="popupWindowUpdate">
			<div>UPDATE</div>
				
			<div style="overflow: hidden;">
				<table>
					
					<tr>
						<td align="right">Code:</td>
						<td align="left"><input id="CodeUpdate" /></td>
					</tr>
					<tr>
						<td align="right">Name:</td>
						<td align="left"><input id="NameUpdate" /></td>
					</tr>
					<tr>
						<td align="right">Address:</td>
						<td align="left"><input id="AddressUpdate" /></td>
					</tr>
					
					<tr>
					
						<td align="right"></td>
						<td style="padding-top: 10px;" align="right"><input
							style="margin-right: 5px;" type="button" id="SaveUpdate"
							value="Save" /><input id="CancelUpdate" type="button"
							value="Cancel" /></td>
					</tr>
				</table>
				<div id="errorupdate" style = " color: #b00404; white-space: nowrap, margin-top:2px, margin-left:2px"></div>
			</div>
		</div>
	</div>
</body>
</html>