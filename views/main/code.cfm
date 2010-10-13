<div class="grid_6" id="generate-left">
    <h4><cfoutput>Viewing #rc.filename#</cfoutput></h4>
    <!--- Read the submitted file --->
    <cffile action = "read" file = "#rc.directory#/#rc.filename#" variable = "codeFile">
    
    <strong><cfoutput>#LCase(rc.filename)#</cfoutput></strong><br />
    <script type="syntaxhighlighter" class="brush: sql"><![CDATA[<cfoutput>#codeFile#</cfoutput>]]></script>
    
    <p class="line"></p>
	
	<p class="button">
		<cfoutput><a onclick="javascript:window.close()">Close</a></cfoutput>
	</p>
</div>