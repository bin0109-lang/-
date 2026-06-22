#import <substrate.h>
#import <dispatch/dispatch.h>

static void patchSignLimit(){
    task_t task = mach_task_self();
    vm_address_t addr = 0;
    vm_size_t size;
    while(vm_region(task,&addr,&size,NULL,NULL,NULL,NULL)==KERN_SUCCESS){
        uint32_t *ptr = (uint32_t *)addr;
        for(int i = 0; i < size / 4; i++){
            if(ptr[i] == 15){
                ptr[i] = 9999;
            }
        }
        addr += size;
    }
}

%constructor
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3LL * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        patchSignLimit();
    });
}
