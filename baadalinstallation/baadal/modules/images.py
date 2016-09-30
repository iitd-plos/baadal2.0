
imageprofiles = [
{
    'Id' : '10.237.20.236:5000/python' ,
    'cmd' : 'bash -c "tail -f /dev/null"',
    #'cmd' : 'bash',
    #'mountdestdir' : '/usr/app/src',
    'mountdestdir':None,
    'restartpolicy' : 2    ,
    'type': 'python',
    'port' : 'None' ,
    'permissiondrop' : [],
    'permissionadd' : [],
    'links' : [],
    'updatemysql':False
},
{
    'Id' : '10.237.20.236:5000/djangogit' ,
    'cmd' : 'bash -c "tail -f /dev/null"',
    #'cmd' : 'bash',
    #'mountdestdir' : '/usr/src/app',
    'mountdestdir':None,
    'restartpolicy' : 2    ,
    'port' : 8000,
    'type' : 'python +django',
    'permissiondrop' : [],
    'permissionadd' : [],
    'links' : [],
     'updatemysql':False
},
{
    'Id' : '10.237.20.236:5000/apachegit' ,
    'cmd' : 'bash -c "tail -f /dev/null"',
    #'cmd' : 'bash',
    #'mountdestdir' : '/var/www/app',
    'mountdestdir':None,
    'restartpolicy' : 2    ,
    'port' : 80,
    'type' : 'php +apache',
    'permissiondrop' : ["SETFCAP","SETPCAP","SYS_CHROOT"],
    'permissionadd' : [],
         'links' : [],
     'updatemysql':False
},{
'Id':'10.237.20.236:5000/wordpress',
'cmd' : 'bash -c "tail -f /dev/null"',
    #'cmd' : 'bash',
    'mountdestdir' : None,
    'restartpolicy' : 2    ,
    'port' : 80,
    'type' : 'wordpress',
    'permissiondrop' : [],
    'permissionadd' : [],
    #'links' : [('/some-mysql' ,'mysql')]
    'links':[],
    'updatemysql':True,
    
},{
'Id':'10.237.20.236:5000/ubuntu',
'cmd' : 'bash -c "tail -f /dev/null"',
    #'cmd' : 'bash',
    'mountdestdir' : None,
    'restartpolicy' : 2    ,
     'port' : None,
    'type' : 'ubuntu',
    'permissiondrop' : [],
    'permissionadd' : [],
    'links' : [],
     'updatemysql':False
},
{
    'Id' : '10.237.20.236:5000/apachephpmysqlgit' ,
    'cmd' : 'bash -c "tail -f /dev/null"',
    #'cmd' : 'bash',
    #'mountdestdir' : '/var/www/app',
     'mountdestdir' : None,
    'restartpolicy' : 2    ,
    'port' : 80,
    'type' : 'php +apache+mysql',
    'permissiondrop' : ["SETFCAP","SETPCAP","SYS_CHROOT"],
    'permissionadd' : [],
         'links' : [],
     'updatemysql':True
},
{
    'Id' : '10.237.20.236:5000/gcc' ,
    'cmd' : 'bash -c "tail -f /dev/null"',
    #'cmd' : 'bash',
    #'mountdestdir' : '/var/www/app',
     'mountdestdir' : None,
    'restartpolicy' : 2    ,
    'port' : None,
    'type' : 'gcc',
    'permissiondrop' : ["SETFCAP","SETPCAP","SYS_CHROOT"],
    'permissionadd' : [],
         'links' : [],
     'updatemysql':False
}
]

def getImageProfile(templateid):
    return imageprofiles[templateid-1];

def getImageProfileList():
    return imageprofiles;

def getImage(imageId):
    print(imageId)
    for i,imageprofile in enumerate(imageprofiles):
        if imageprofile['Id'] == imageId:
            imageprofile['templateid'] = i+1
            return imageprofile
    
    return {'templateid':1,'type':'Unknown'}