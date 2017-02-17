from vm_helper import migrate, find_new_host
from log_handler import logger, baadal_maintenance_logger
import datetime

print "*********** MIGRATION FROM DR STARTED ******** "
start_time = datetime.datetime.now()
logger.debug("Start time of migration from dr  " + str(start_time))
baadal_maintenance_logger.debug("Start time of migration from dr   " + str(start_time))
vms=current.db(current.db.vm_data.priority == 2).select()
for vm in vms:
    host_sites=current.db.host[vm.host_id].host_site
    if host_sites=='dr':
        vm_details = current.db.vm_data[vm.id]
        params={}
        params['vm_id'] = vm.id
        params['destination_host'] = find_new_host(vm_details.RAM, vm_details.vCPU, 'dc')
        if vm.status == 2:
            params['live_migration'] = 'on'
        else:
            params['live_migration'] = 'off'
        migrate(params)
end_time = datetime.datetime.now()
logger.debug("Completion time of migration from dr  " + str(end_time))
baadal_maintenance_logger.debug("Completion time of migration from dr   " + str(end_time))
print "*********** MIGRATION FROM DR COMPLETED ******** "
