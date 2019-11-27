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
<script type="text/javascript"
	src="../../jqwidgets/jqxgrid.selection.js"></script>
<script type="text/javascript" src="../../jqwidgets/jqxgrid.edit.js"></script>
<script type="text/javascript" src="../../scripts/demos.js"></script>
<style>
#jqxGrid .jqx-grid-column-header {
	font-weight: bold;
}

#jqxGrid .jqx-grid-cell {
	color: rgb(148, 198, 255);
	font-size: 12px;
}

.specialtext {
	color: orange !important;
}

.description {
	color: whitesmoke !important;
}

.sellformat {
	color: red !important;
}

.buyformat {
	color: greenyellow !important;
}

.booleanvalue {
	color: mistyrose !important;
	background-color: aquamarine;
	pointer-events: none;
	visibility: hidden;
}

.quoteonthewire input {
	background-color: whitesmoke;
	color: gray !important;
}

.quoterequested input {
	background-color: rgb(231, 86, 60);
	color: white !important;
}

.jqx-grid-cell {
	border-color: black !important;
	border-right: none;
	border-bottom-width: 2px;
}

.jqx-grid-cell .jqx-grid-cell-left-align {
	margin-top: 10px !important;
}

.jqx-grid-statusbar {
	background-color: rgb(22, 22, 22) !important;
}

.jqx-grid-statusbar span {
	color: rgb(148, 198, 255);
	font-size: 12px;
}
</style>
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

							pageable : true,
							autoheight : true,
							sortable : true,
							altrows : true,
							enabletooltips : true,
							editable : false,

							columns : [ {
								text : 'Student Code',
								columngroup : 'studentCode',
								datafield : 'studentCode',
								width : 100,

							}, {
								text : 'Student Name',
								columngroup : 'studentName',
								datafield : 'studentName',
								cellsalign : 'right',
								align : 'right',
								width : 250
							}, {
								text : 'Address',
								columngroup : 'address',
								datafield : 'address',
								align : 'right',
								cellsalign : 'right',
								cellsformat : 'c2',
								width : 400
							}, ],

						});
						$("#addrowbutton").jqxButton();
						$("#deleterowbutton").jqxButton();
						$("#updaterowbutton").jqxButton();
						$("#deleterowbutton").bind('click', function () {
							var getselectedrowindexes = $('#grid').jqxGrid('getselectedrowindexes');
			                if (getselectedrowindexes.length > 0)
			                {
			                    // returns the selected row's data.
			                    var selectedRowData = $('#grid').jqxGrid('getrowdata', getselectedrowindexes[0]).uid;
			                    if (confirm("Do you want to delete")) {
			                    	$.ajax({
				                        type: "POST",
				                        url: '/index/delete',
				                        data: {
				                            lastrowkey: selectedRowData
				                        },
				                        success: function() {
				                        	location.reload();
				                        }
				                    });
				                    console.log(selectedRowData);
			                    }
			                    return false;
			                    
			                } 
			                $("#addrowbutton").bind('click', function () {
								var getselectedrowindexes = $('#grid').jqxGrid('getselectedrowindexes');
				                if (getselectedrowindexes.length > 0)
				                {
				                    // returns the selected row's data.
				                    var selectedRowData = $('#grid').jqxGrid('getrowdata', getselectedrowindexes[0]).uid;
				                   
				                    	$.ajax({
					                        type: "POST",
					                        url: '/index/add',
					                        data: {
					                            lastrowkey: selectedRowData
					                        },
					                        success: function() {
					                        	location.reload();
					                        }
					                    });
					                    console.log(selectedRowData);				                  
				                    
				                } 
							
				            
				        });
					});
</script>
</head>
<body class='default'>


	<div style="padding-top: 40px; margin: auto;">

		<div>
			<input id="addrowbutton" type="button" value="Add New Row" />
		</div>
		<div style="margin-top: 10px;">
			<input id="deleterowbutton" type="button" value="Delete Selected Row" />
		</div>
		<div style="margin-top: 10px;">
			<input id="updaterowbutton" type="button" value="Update Selected Row" />
		</div>
		<div id="grid"></div>
	</div>
</body>
</html>