set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.1.00.08'
,p_default_workspace_id=>1690400486946418
,p_default_application_id=>119
,p_default_owner=>'DEMO'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/region_type/com_apexconsulting_apex_jet_pictochart
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(53321912187437449)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.APEXCONSULTING.APEX.JET.PICTOCHART'
,p_display_name=>'JET PictoChart'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'[require jet]#PLUGIN_FILES#pictoChart.js',
''))
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
' * render - function to create placeholder div tag, and initialise the  component',
' */',
' function render ',
'( p_region                in  apex_plugin.t_region',
', p_plugin                in  apex_plugin.t_plugin',
', p_is_printer_friendly   in  boolean ',
') return apex_plugin.t_region_render_result ',
'is',
'  c_region_static_id      constant varchar2(255)  := apex_escape.html_attribute( p_region.static_id );',
'begin',
'  -- Add placeholder div',
'  sys.htp.p (',
'     ''<div class="a-JET-PictoChart" id="'' || c_region_static_id || ''_region">'' ||',
'       ''<div class="a-JET-PictoChart-container" id="'' || c_region_static_id || ''_chart"></div>'' ||',
'     ''</div>'' );',
'     ',
'  -- Initialize the chart',
'  apex_javascript.add_onload_code',
'  ( p_code => ''jet.picto.init(''||',
'                  ''"#''||c_region_static_id||''_chart", ''          || -- pRegionId',
'                  ''"'' || apex_plugin.get_ajax_identifier ||''"''   || -- pApexAjaxIdentifier',
'                 '')''',
'  );',
'  ',
'  return null;',
'end render;',
'',
'/*',
' * ajax - function to process SQL query, and output JSON data for legend',
' */',
'function ajax',
'( p_region    in  apex_plugin.t_region',
', p_plugin    in  apex_plugin.t_plugin ',
') return apex_plugin.t_region_ajax_result',
'is',
'  c       sys_refcursor;',
'  l_query varchar2(32767);',
'begin  ',
'  l_query := p_region.source;',
'  open c for l_query;',
'  apex_json.open_object;',
'  apex_json.write(''items'', c);',
'',
'  -- add settings',
'  apex_json.write(''animationOnDisplay'' , p_region.attribute_01);',
'  apex_json.write(''columnCount''        , p_region.attribute_02);',
'  apex_json.write(''layout''             , p_region.attribute_03);',
'',
'  apex_json.close_object;',
'  return null;',
'end ajax;',
''))
,p_api_version=>1
,p_render_function=>'render'
,p_ajax_function=>'ajax'
,p_standard_attributes=>'SOURCE_SQL'
,p_substitute_attributes=>false
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0.0'
,p_files_version=>85
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(53472003135201341)
,p_plugin_id=>wwv_flow_api.id(53321912187437449)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'animationOnDisplay'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_show_in_wizard=>false
,p_default_value=>'auto'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(53472426459202280)
,p_plugin_attribute_id=>wwv_flow_api.id(53472003135201341)
,p_display_sequence=>10
,p_display_value=>'auto'
,p_return_value=>'auto'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(53472921379203379)
,p_plugin_attribute_id=>wwv_flow_api.id(53472003135201341)
,p_display_sequence=>20
,p_display_value=>'popIn'
,p_return_value=>'popIn'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(53473252305204133)
,p_plugin_attribute_id=>wwv_flow_api.id(53472003135201341)
,p_display_sequence=>30
,p_display_value=>'alphaFade'
,p_return_value=>'alphaFade'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(53473703291204734)
,p_plugin_attribute_id=>wwv_flow_api.id(53472003135201341)
,p_display_sequence=>40
,p_display_value=>'zoom'
,p_return_value=>'zoom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(53474074636205244)
,p_plugin_attribute_id=>wwv_flow_api.id(53472003135201341)
,p_display_sequence=>50
,p_display_value=>'none'
,p_return_value=>'none'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(53474657392211036)
,p_plugin_id=>wwv_flow_api.id(53321912187437449)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'columnCount'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_show_in_wizard=>false
,p_default_value=>'5'
,p_display_length=>3
,p_max_length=>3
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(53475816762217347)
,p_plugin_id=>wwv_flow_api.id(53321912187437449)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'layout'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_show_in_wizard=>false
,p_default_value=>'horizontal'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(53476394117217773)
,p_plugin_attribute_id=>wwv_flow_api.id(53475816762217347)
,p_display_sequence=>10
,p_display_value=>'vertical'
,p_return_value=>'vertical'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(53476796271218528)
,p_plugin_attribute_id=>wwv_flow_api.id(53475816762217347)
,p_display_sequence=>20
,p_display_value=>'horizontal'
,p_return_value=>'horizontal'
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(219545894080425)
,p_plugin_id=>wwv_flow_api.id(53321912187437449)
,p_name=>'SOURCE_SQL'
,p_sql_min_column_count=>1
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'elect ename||'' - ''||job||''@''||dname "name"',
'             ,      ''human'' "shape"',
'             ,      count(*) over (partition by job) "count"',
'             ,      case job',
'                    when ''PRESIDENT'' then ''black''',
'                    when ''ANALYST''   then ''blue''',
'                    when ''CLERK''     then ''green''',
'                    when ''MANAGER''   then ''red''',
'                    when ''SALESMAN''  then ''yellow''',
'                    end "color"',
'             from   emp',
'                    join dept on emp.deptno = dept.deptno',
'             order by emp.job;'))
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '212066756E6374696F6E20286A65742C20242C207365727665722C207574696C2C20646562756729207B0A202020202275736520737472696374223B0A0A202020206A65742E706963746F203D207B0A2020202020202020696E69743A2066756E637469';
wwv_flow_api.g_varchar2_table(2) := '6F6E202870526567696F6E49642C207041706578416A61784964656E74696669657229207B0A20202020202020202020202072657175697265285B226F6A732F6F6A636F7265222C20226A7175657279222C20226F6A732F6F6A706963746F6368617274';
wwv_flow_api.g_varchar2_table(3) := '225D2C2066756E6374696F6E20286F6A2C202429207B0A202020202020202020202020202020207365727665722E706C7567696E287041706578416A61784964656E7469666965722C207B7D2C207B0A2020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(4) := '737563636573733A2066756E6374696F6E2028704461746129207B0A202020202020202020202020202020202020202020202020242870526567696F6E4964290A202020202020202020202020202020202020202020202020202020202E6F6A50696374';
wwv_flow_api.g_varchar2_table(5) := '6F4368617274287044617461293B0A20202020202020202020202020202020202020207D0A202020202020202020202020202020207D293B0A2020202020202020202020207D293B0A20202020202020207D0A202020207D0A7D2877696E646F772E6A65';
wwv_flow_api.g_varchar2_table(6) := '74203D2077696E646F772E6A6574207C7C207B7D2C20617065782E6A51756572792C20617065782E7365727665722C20617065782E7574696C2C20617065782E6465627567293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(53452614253671796)
,p_plugin_id=>wwv_flow_api.id(53321912187437449)
,p_file_name=>'pictoChart.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
