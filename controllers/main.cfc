/*
	Migration Tracking System

	Provides view specific functionality for the admin area.
*/
component {
    function init(fw) {
        variables.fw = fw;
    }

    private function blankPage(any rc){
        request.layout = false;
        getpagecontext().getcfoutput().clearall();
        return;
    }
    
    // UPLOAD FUNCTIONALITY
    function upload(any rc){
        blankPage();
        
        // certain file operations are not supported in script style
        // until cf901, so just include it here
        rc.fileObj = new assets.cfc.file();
    }
    
    // REMOVE FUNCTIONALITY
    function remove(any rc){
        blankPage();
        
        // certain file operations are not supported in script style
        // until cf901, so just include it here
        rc.fileObj = new assets.cfc.file();
    }
    
    // LOADING FUNCTIONS
    private function loadChange(any rc){ // provides us with lookups, app persistent model, and official application name
        // load app dependencies
        variables.fw.service("main.lookups","lookups");
        
        // load the app
        variables.fw.service("main.get","app");
        if( StructKeyExists(rc,"id") ){
			// load the app related files
			rc.directory = ExpandPath('./assets/migrations/queued');
			variables.fw.service("main.directoryListing","int_development",{pattern="internal_development_*"});
			variables.fw.service("main.directoryListing","int_testing",{pattern="internal_testing_*"});
			variables.fw.service("main.directoryListing","int_staging",{pattern="internal_staging_*"});
			variables.fw.service("main.directoryListing","int_production",{pattern="internal_production_*"});
			variables.fw.service("main.directoryListing","ext_development",{pattern="external_development_*"});
			variables.fw.service("main.directoryListing","ext_testing",{pattern="external_testing_*"});
			variables.fw.service("main.directoryListing","ext_staging",{pattern="external_staging_*"});
			variables.fw.service("main.directoryListing","ext_production",{pattern="external_production_*"});
			variables.fw.service("main.directoryListing","changeFiles",{pattern="*"});
		}
    }

	function start(any rc) {
		rc.title="Home";
        rc.designId="I-1.0";
	}
    
    function change(any rc){
        loadChange(rc);
    
        rc.title="Change Request";
        rc.designId="I-7.0";
    }
    
    function endSave(any rc){
        // was there an error?
        if( !isNull(rc.data.error) ){
            rc.notice = {type="error", message=rc.data.error.message};
        } else {
            rc.notice = {type="success", message="Record saved"};
        }

        // oki doki, to the page!
        rc.id = rc.data.app.getId();
        variables.fw.redirect("main.files","notice","id");
    }
    
    function files(any rc){
        loadChange(rc);
    
        rc.title="Upload Files";
        rc.designId="I-7.0";
    }
    
    function done(any rc){
        rc.json = false; // we don't want anything returned in json format!
        loadChange(rc);
    
        rc.title="Order Summary";
        rc.designId="I-7.0";
    }
    
    function code(any rc){
        loadChange(rc);
        
        rc.title="Code";
        rc.designId="I-7.0";
    }
    
    function orders(any rc){
        rc.migrations = EntityLoad("Migrations");
        
        rc.title="Orders";
        rc.designId="I-7.0";
    }
}