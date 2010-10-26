<cfparam name="rc.mode" default="view" />
<!--- Read the submitted file --->
<cffile action = "read" file = "#rc.directory#/#rc.filename#" variable = "codeFile">

<div class="grid_6" id="generate-left">
    <cfif rc.mode EQ "view">
        <h4><span style="color:green">Viewing</span> <cfoutput>#rc.filename#</cfoutput></h4>
        <strong><cfoutput>#LCase(rc.filename)#</cfoutput></strong><br />
        <script type="syntaxhighlighter" class="brush: sql"><![CDATA[<cfoutput>#codeFile#</cfoutput>]]></script>
    <cfelse>
        <h4><span style="color:red">Editing</span> <cfoutput>#rc.filename#</cfoutput></h4>
        <!--- Put the contents in a text box --->
        <form action="" method="post">
            <textarea name="code" style="width:100%;height:400px"><cfoutput>#codeFile#</cfoutput></textarea>
        </form>
    </cfif>
    <p class="line"></p>
	
	<p class="button">
		<cfoutput><a onclick="javascript:window.close()">Close</a></cfoutput>
	</p>
</div>