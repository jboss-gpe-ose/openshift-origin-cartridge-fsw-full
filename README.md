iPaaS Openshift Cartridge using FSW
==============================

Overview
--------
* Provides an Openshift Enterprise (OSE) cartridge with full suite of Red Hat Fuse Service Works functionality.  
* A view of the deployment architecture of a gear using this cartridge can be found [here.](https://raw.github.com/jboss-gpe-ose/openshift-origin-cartridge-fsw-full/master/doc/images/bpmPaaS-standalone-deployment-architecture.png)
* This cartridge is essentially a fork of the OSE jbosseap cartridge.
  Subsequently, most of administration guidelines documented in the jbosseap cartridge apply to this cartridge.
* As of 10 Feb. 2014, the version of FSW 6 used is from :  jboss-fsw-installer-6.0.0.GA-redhat-4.jar


Details
-------
* This cartridge relies on RPMs.  In particular:

. [an RPM](https://github.com/jboss-gpe-ose/jboss_bpm_soa_rpmbuild) that pre-installs JBoss EAP 6.1.1 on an Openshift Enterprise _node_.  NOTE:  This cartridge does not rely on the JBoss EAP available through the jbappplatform channel of the Red Hat Network.  The release cycle of JBoss EAP from that channel is not in sync with releases of FSW.  ie:  to-date, the version of EAP available from the jbappplatform channel is 6.2.  FSW6 has a hard-requirement on EAP 6.1.1 specifically.
. [an RPM](https://github.com/jboss-gpe-ose/fsw_rpmbuild)  that pre-installs FSW6 modules and web artifacts on an Openshift Enterprise _node_.


The size of EAP 6.1.1 + FSW6  makes bundling of all of this within this downloadable cartridge impratical.  Because of the use of custom RPMs, this cartridge will only work on those Openshift Enterprise environments that have installed these custom RPMs.  Subsequently, this cartridge will not currently work on Openshift Online.

* This cartridge relies on the MySQL database provided by the OSE MySQL cartridge.
* In particular, MySQL is used to maintain the jbpm, rtgov and sramp and bpel databases
* This cartridge adheres to the OSE 1.2 cartridge specification.

  

INITIAL SETUP          
--------------------
1.  Create an OSE 1.2 environment that supports a medium gear size
2.  Install OSE 1.2 rhc tools
3.  Review the jboss_bpm_soa RPM found [here](https://github.com/jboss-gpe-ose/jboss_bpm_soa_rpmbuild)
4.  On your OSE nodes, install the jboss_bpm_soa RPM    
5.  Review the fsw RPM found [here](https://github.com/jboss-gpe-ose/fsw_rpmbuild)
7.  On your OSE nodes, install the fsw RPM    
8.  Delete any previous fsw related OSE applications that you may have previously created:
      rhc app delete -a fsw0
9.  Create the *full* FSW6 *full* OSE application and add to it a mysql cartridge:
        rhc app create fsw0 https://raw.github.com/jboss-gpe-ose/openshift-origin-cartridge-fsw-full/master/metadata/manifest.yml mysql -g fsw_medium --no-git --noprompt



TEST
--------------------
    
    
== TODO
. Currently, universal userId/passwd for all FSW functionality is:   fswAdmin / jb0ssredhat!
** how would management of these credentials works in a cartridge considering there is a Vault and SAML tokens generated ?
