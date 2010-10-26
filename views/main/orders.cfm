<cfset helper = new assets.cfc.helpers() />

<div class="grid_6" id="generate-left">
    <cfif arrayLen(rc.migrations) EQ 0>
        <h2>Yo fool there is nothing to do!</h2>
    <cfelse>
        <table width="100%" class="tablesorter" data-sort="[[1,1],[0,1]]" >
            <thead>
                <tr>
                    <th>Order</th>
                    <th>Ticket #</th>
                    <th>Application</th>
                    <th>Description</th>
                    <th>Submitted</th>
                    <th>Updated</th>
                    <th>Due</th>
                </tr>
            </thead>
            <tbody>
                <cfloop array="#rc.migrations#" index="i">
                    <tr>
                        <cfoutput>
                            <td><a href="#buildURL('main.done&id=' & i.getId())#">#i.getId()#</a></td>
                            <td>#i.getTicketNumber()#</td>
                            <td>#i.getApplication().getName()#</td>
                            <td>#Mid(trim(i.getDescription()),1,50)#</td>
                            <td>#helper.relativeDate(i.getCreated())#</td>
                            <td>#helper.relativeDate(i.getUpdated())#</td>
                            <td>#helper.relativeDate(i.getDue())#</td>
                        </cfoutput>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    </cfif>
</div>