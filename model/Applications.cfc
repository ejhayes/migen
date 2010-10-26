/**
 * @persistent
 */
component schema="MIGRATION" table="A_APPLICATIONS"
{
    property name="Id" fieldtype="id" generator="sequence" ormtype="int" params="{schema='MIGRATION',sequence='A_SEQ'}";
    property name="Name" column="NAME";
    property name="Steward" column="STEWARD";
    property name="SchemaOwner" column="SCHEMA_OWNER";
    property name="SchemaReader" column="SCHEMA_READER";
    
    // Application Migrations (all)
    property name="Migrations" fkcolumn="A_ID" cfc="Migrations" type="array" fieldtype="one-to-many" orderby="CREATED_DATE asc";
}