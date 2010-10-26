<cfset helper = new assets.cfc.helpers() />
<div class="grid_6" id="generate-left">
	<cfoutput>	
	<h2>Thank you, your order number is <span style="color:green"><cfoutput>#rc.id#</cfoutput></span> (due #dateFormat(rc.app.record.getDue(),"dddd, m/d/yyyy")#)</h2>
	<h4>Summary (<a href="#buildURL('main.change&id=' & rc.id)#">edit</a>)</h4>
    <p>
    <strong>Request Created by #rc.app.record.getCreatedBy()# on #dateFormat(rc.app.record.getCreated(),"m/d/yyyy (dddd)")# at #timeFormat(rc.app.record.getCreated(),"h:mm tt")#</strong><br />
    <strong>Target Application:</strong> #rc.app.record.getApplication().getName()# (data steward is #rc.app.record.getApplication().getSteward()#)<br />
    <strong>Related Track-It Tickets:</strong> #rc.app.record.getTicketNumber()#<br />
    <strong>Description:</strong><br />#ParagraphFormat(rc.app.record.getDescription())#
    </cfoutput>
    </p>
    
    <h4><cfoutput>Submitted Code (partial) (<a href="#buildURL('main.files&id=' & rc.id)#">edit</a>)</cfoutput></h4>
    <cfloop array="#rc.changeFiles#" index="i">
        <!--- Read the submitted file --->
        <cffile action = "read" file = "#rc.directory#/#i.name#" variable = "codeFile">
        
        <strong><cfoutput>#LCase(i.name)# (<a href="#buildURL('main.code&id=' & rc.id)#&filename=#i.name#" target="_blank">view full file</a>)</cfoutput></strong><br />
        <script type="syntaxhighlighter" class="brush: sql"><![CDATA[<cfoutput>#Mid(codeFile,1,800)##chr(13)##chr(10)#-- NOTE: THIS IS A PARTIAL VIEW OF #UCase(i.name)#</cfoutput>]]></script>
    </cfloop>
    
    <p class="line"></p>
	
	<p class="button">
		<cfoutput><a href="#buildURL('main.start')#">Close</a></cfoutput>
	</p>
</div>