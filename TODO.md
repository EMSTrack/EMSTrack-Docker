# TODO

Last updated 02/01/2022

## EMSTrack-MQTT

### Configure mosquitto to run with the new go auth plugin  

Change should be straightforward because settings are virtually the same and the new devel branch of mqtt already compiles the go plugin

This is a urgent change because the current c-based authentication plugin is no longer supported and could be subject to security threats

### Upgrade to mosquitto 2.0

Should not be difficult but require extensive testing

This is a less urgent change because the latest version of the 1.x series is still supported and actively patched

## EMSTrack-Django

### Add ambulance message

Messages should have the same permissions as ambulances  

Messages can not be modified once posted

They can be deleted by the user who posted it or an admin user  

base url should be

    /ambulace/{ambulance_id}/message   

new api points should implement:

1. list (paginated, sorted in descending order by timestamp)
2. put
3. delete  
 
Expected changes in:

1. model
2. serializer
3. viewset
     
Implement tests

### Waypoint swap  

Add new api points to provide the ability to swap the order of two waypoints

base url should be

    /call/{call_id}/ambulance/{ambulance_id}/waypoint/swap  

waipoints to swap should be provided in json with structure  

    { waypoint1: {id: numeric, order: numeric}, waypoint2: {id: numeric, order: numeric} }

Should test for existence and correct order before making the swap

Send error message in case of inconsistencies

Implement tests

### Waypoint undo

Add new api point to provide the ability to undo the last waypoint update  

base url should be

    /call/{call_id}/ambulance/{ambulance_id}/waypoint/undo

Should undo the last change of status of waypoints  

Should also search for change of status of ambulance occurring at the same time and reverse it  

Should not delete waypoints that were inserted; user must skip waypoint as a way to delete them

Should issue error if undo is not possible

Should issue warning if it was possible to undo the change in waypoints but not the change in ambulance status

Implement tests

### Fix tests to be compatible with new mqtt-publish-client
