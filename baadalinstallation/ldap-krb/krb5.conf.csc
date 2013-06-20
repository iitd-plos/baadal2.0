[libdefaults]
	default_realm = IITD.ERNET.IN

# The following krb5.conf variables are only for MIT Kerberos.
	krb4_config = /etc/krb.conf
	krb4_realms = /etc/krb.realms
	kdc_timesync = 1
	ccache_type = 4
	forwardable = true
	proxiable = true

# The following encryption type specification will be used by MIT Kerberos
# if uncommented.  In general, the defaults in the MIT Kerberos code are
# correct and overriding these specifications only serves to disable new
# encryption types as they are added, creating interoperability problems.
#
# Thie only time when you might need to uncomment these lines and change
# the enctypes is if you have local software that will break on ticket
# caches containing ticket encryption types it doesn't know about (such as
# old versions of Sun Java).

#	default_tgs_enctypes = des3-hmac-sha1
#	default_tkt_enctypes = des3-hmac-sha1
#	permitted_enctypes = des3-hmac-sha1

# The following libdefaults parameters are only for Heimdal Kerberos.
	v4_instance_resolve = false
	v4_name_convert = {
		host = {
			rcmd = host
			ftp = ftp
		}
		plain = {
			something = something-else
		}
	}
	fcc-mit-ticketflags = true

[realms]
	IITD.ERNET.IN = {
		kdc = ldap1.iitd.ernet.in:88
		kdc = ldap2.iitd.ernet.in:88
		admin_server = ldap1.iitd.ernet.in
		default_domain = iitd.ernet.in
	}
	ATHENA.MIT.EDU = {
		kdc = kerberos.mit.edu:88
		kdc = kerberos-1.mit.edu:88
		kdc = kerberos-2.mit.edu:88
		admin_server = kerberos.mit.edu
		default_domain = mit.edu
	}
	MEDIA-LAB.MIT.EDU = {
		kdc = kerberos.media.mit.edu
		admin_server = kerberos.media.mit.edu
	}
	ZONE.MIT.EDU = {
		kdc = casio.mit.edu
		kdc = seiko.mit.edu
		admin_server = casio.mit.edu
	}
	MOOF.MIT.EDU = {
		kdc = three-headed-dogcow.mit.edu:88
		kdc = three-headed-dogcow-1.mit.edu:88
		admin_server = three-headed-dogcow.mit.edu
	}
	CSAIL.MIT.EDU = {
		kdc = kerberos-1.csail.mit.edu
		kdc = kerberos-2.csail.mit.edu
		admin_server = kerberos.csail.mit.edu
		default_domain = csail.mit.edu
		krb524_server = krb524.csail.mit.edu
	}
	IHTFP.ORG = {
		kdc = kerberos.ihtfp.org
		admin_server = kerberos.ihtfp.org
	}
	GNU.ORG = {
		kdc = kerberos.gnu.org
		kdc = kerberos-2.gnu.org
		kdc = kerberos-3.gnu.org
		admin_server = kerberos.gnu.org
	}
	1TS.ORG = {
		kdc = kerberos.1ts.org
		admin_server = kerberos.1ts.org
	}
	GRATUITOUS.ORG = {
		kdc = kerberos.gratuitous.org
		admin_server = kerberos.gratuitous.org
	}
	DOOMCOM.ORG = {
		kdc = kerberos.doomcom.org
		admin_server = kerberos.doomcom.org
	}
	ANDREW.CMU.EDU = {
		kdc = vice28.fs.andrew.cmu.edu
		kdc = vice2.fs.andrew.cmu.edu
		kdc = vice11.fs.andrew.cmu.edu
		kdc = vice12.fs.andrew.cmu.edu
		admin_server = vice28.fs.andrew.cmu.edu
		default_domain = andrew.cmu.edu
	}
	CS.CMU.EDU = {
		kdc = kerberos.cs.cmu.edu
		kdc = kerberos-2.srv.cs.cmu.edu
		admin_server = kerberos.cs.cmu.edu
	}
	DEMENTIA.ORG = {
		kdc = kerberos.dementia.org
		kdc = kerberos2.dementia.org
		admin_server = kerberos.dementia.org
	}
	stanford.edu = {
		kdc = krb5auth1.stanford.edu
		kdc = krb5auth2.stanford.edu
		kdc = krb5auth3.stanford.edu
		master_kdc = krb5auth1.stanford.edu
		admin_server = krb5-admin.stanford.edu
		default_domain = stanford.edu
	}

[domain_realm]
	.mit.edu = ATHENA.MIT.EDU
	mit.edu = ATHENA.MIT.EDU
	.media.mit.edu = MEDIA-LAB.MIT.EDU
	media.mit.edu = MEDIA-LAB.MIT.EDU
	.csail.mit.edu = CSAIL.MIT.EDU
	csail.mit.edu = CSAIL.MIT.EDU
	.whoi.edu = ATHENA.MIT.EDU
	whoi.edu = ATHENA.MIT.EDU
	.stanford.edu = stanford.edu
	.slac.stanford.edu = SLAC.STANFORD.EDU

[login]
	krb4_convert = true
	krb4_get_tickets = false
