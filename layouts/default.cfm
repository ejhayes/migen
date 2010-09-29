<!DOCTYPE html> 
<html> 
	<head>
		<title><cfoutput>#this.config.short_name#<cfif StructKeyExists(rc,"title")> - #rc.title#</cfif></cfoutput></title>
        <link type="text/css" rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/ui.all.css" />
        <link type="text/css" rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.2/themes/smoothness/jquery-ui.css" />
        <link rel="stylesheet" href="assets/stylesheets/reset.css" type="text/css" />
		<link rel="stylesheet" href="assets/stylesheets/text.css" type="text/css" />
        <cfif rc.action EQ "main.start">
		<link rel="stylesheet" href="assets/stylesheets/480.css" type="text/css" />
        <cfelse>
        <link rel="stylesheet" href="assets/stylesheets/960.css" type="text/css" />
        </cfif>
		<link rel="stylesheet" href="assets/stylesheets/application.css" type="text/css" />
        <link rel="stylesheet" href="assets/stylesheets/forms.css" type="text/css" media="screen" title="no title" charset="utf-8" /> 
        <link rel="stylesheet" href="assets/stylesheets/buttons.css" type="text/css" media="screen" title="no title" charset="utf-8" />
        <link rel="stylesheet" href="assets/stylesheets/fileuploader.css" type="text/css">	
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script> 
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.2/jquery-ui.min.js"></script>
		<script type="text/javascript" src="assets/javascripts/cufon-yui.js"></script>
		<script type="text/javascript" src="assets/javascripts/ChunkFive_400.font.js"></script>
		<script type="text/javascript" src="assets/javascripts/application.js"></script>
        <script type="text/javascript" src="assets/javascripts/fileuploader.js"></script>
	</head>
	<body>
        <script type="text/javascript">
            $(function() {
                // dates can be arbitrary, but not too much
                
                $(".datepicker").datepicker({ minDate: 0, maxDate: "+1M +10D", noWeekends: true, beforeShowDay: $.datepicker.noWeekends });
                
                $(".uploader").each(function() {
                    // register the file uploader
                    var uploader = new qq.FileUploader({
                        element: this,
                        action: '<cfoutput>#buildURL("main.upload")#</cfoutput>',
                        allowedExtensions: ['sql'],
                        minSizeLimit: 0, // no empty files!
                        params: {
                            stage: $(this).attr('data-stage'),
                            environment: $(this).attr('data-environment')
                        }
                    });
                });
            });
        </script>
    
		<h1><cfoutput>#this.config.short_name#</cfoutput></h1>
		<div class="container_6">
		<cfoutput>#body#</cfoutput>
		</div>
	</body>
</html>