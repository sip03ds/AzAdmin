Configuration Rsyslog {
    Function LinuxString($inputStr){
        $outputStr = $inputStr.Replace("`r`n","`n")
        $outputStr += "`n"
        Return $outputStr
    }

    Import-DscResource -ModuleName nx

    Node IsPresent
    {
        $rsyslogConf = @'
#### DSC CONF ####
#### MODULES ####

# The imjournal module bellow is now used as a message source instead of imuxsock.
$ModLoad imuxsock # provides support for local system logging (e.g. via logger command)
$ModLoad imjournal # provides access to the systemd journal
#$ModLoad imklog # reads kernel messages (the same are read from journald)
#$ModLoad immark  # provides --MARK-- message capability

Module(load="imfile" PollingInterval="10") 

# Provides UDP syslog reception
#$ModLoad imudp
#$UDPServerRun 514
Module (load="imudp")
Input (type="imudp" port="514")
$AllowedSender UDP, 127.0.0.1, 10.0.0.0/8, *.corp.vionet.gr

# Provides TCP syslog reception
#$ModLoad imtcp
#$InputTCPServerRun 514
module(load="imtcp")
input(type="imtcp" port="514")
$AllowedSender TCP, 127.0.0.1, 10.0.0.0/8, *.corp.vionet.gr

#### GLOBAL DIRECTIVES ####

# Where to place auxiliary files
$WorkDirectory /var/lib/rsyslog

# Use default timestamp format
$ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat

# File syncing capability is disabled by default. This feature is usually not required,
# not useful and an extreme performance hit
#$ActionFileEnableSync on

# Include all config files in /etc/rsyslog.d/
$IncludeConfig /etc/rsyslog.d/*.conf

# Turn off message reception via local log socket;
# local messages are retrieved through imjournal now.
$OmitLocalLogging on

# File to store the position in the journal
$IMJournalStateFile imjournal.state


#### RULES ####

# Log all kernel messages to the console.
# Logging much else clutters up the screen.
#kern.*                                                 /dev/console

# TESTING RSYSLOG from WinSysLog
If $fromhost-ip == "10.1.32.105" then { Action (type="omfile" File="/var/log/rsyslog/WinSysLogTest.log") }

# Microsoft Defender for Identity sensor - corp.vionet.gr
If $fromhost-ip == "10.1.21.13" then { Action (type="omfile" File="/var/log/rsyslog/dc3stlmrs_identity.log") }
If $fromhost-ip == "10.25.80.11" then { Action (type="omfile" File="/var/log/rsyslog/dc2rnlprs_identity.log") }
If $fromhost-ip == "10.44.104.10" then { Action (type="omfile" File="/var/log/rsyslog/dc2strbrg_identity.log") }
If $fromhost-ip == "10.85.144.11" then { Action (type="omfile" File="/var/log/rsyslog/dc2etmsof_identity.log") }
If $fromhost-ip == "10.57.85.10" then { Action (type="omfile" File="/var/log/rsyslog/dc2hlcinf_identity.log") }
If $fromhost-ip == "10.72.116.10" then { Action (type="omfile" File="/var/log/rsyslog/dc2cpwthi_identity.log") }
If $fromhost-ip == "10.1.24.10" then { Action (type="omfile" File="/var/log/rsyslog/dc2flgcrn_identity.log") }
If $fromhost-ip == "10.42.42.10" then { Action (type="omfile" File="/var/log/rsyslog/dc2svlvls_identity.log") }
If $fromhost-ip == "10.25.211.11" then { Action (type="omfile" File="/var/log/rsyslog/dc2mkchrt_identity.log") }
If $fromhost-ip == "10.1.60.11" then { Action (type="omfile" File="/var/log/rsyslog/dc2vmlvtd_identity.log") }
If $fromhost-ip == "10.1.21.234" then { Action (type="omfile" File="/var/log/rsyslog/dc2stlmrs_identity.log") }
If $fromhost-ip == "10.35.35.11" then { Action (type="omfile" File="/var/log/rsyslog/dc3drsdrn_identity.log") }
If $fromhost-ip == "10.31.95.11" then { Action (type="omfile" File="/var/log/rsyslog/dc2vtragh_identity.log") }
If $fromhost-ip == "10.15.18.10" then { Action (type="omfile" File="/var/log/rsyslog/dc2anmasp_identity.log") }
If $fromhost-ip == "10.25.127.10" then { Action (type="omfile" File="/var/log/rsyslog/dc2inbdnb_identity.log") }
If $fromhost-ip == "10.1.21.13" then { Action (type="omfile" File="/var/log/rsyslog/dc3stlmrs_identity.log") }
If $fromhost-ip == "10.25.32.10" then { Action (type="omfile" File="/var/log/rsyslog/dc2brsblg_identity.log") }
If $fromhost-ip == "10.57.22.15" then { Action (type="omfile" File="/var/log/rsyslog/dc3elvinf_identity.log") }
If $fromhost-ip == "10.25.70.10" then { Action (type="omfile" File="/var/log/rsyslog/dc2inbvlj_identity.log") }
If $fromhost-ip == "10.57.21.11" then { Action (type="omfile" File="/var/log/rsyslog/dc2elvinf_identity.log") }
If $fromhost-ip == "10.82.128.11" then { Action (type="omfile" File="/var/log/rsyslog/dc2icmrom_identity.log") }
If $fromhost-ip == "10.25.63.11" then { Action (type="omfile" File="/var/log/rsyslog/dcsdmlmi_identity.log") }
If $fromhost-ip == "10.31.31.11" then { Action (type="omfile" File="/var/log/rsyslog/dc2sdnths_identity.log") }
If $fromhost-ip == "10.1.112.12" then { Action (type="omfile" File="/var/log/rsyslog/dc2cblmrs_identity.log") }
If $fromhost-ip == "10.15.98.11" then { Action (type="omfile" File="/var/log/rsyslog/dc2smtmnd_identity.log") }
If $fromhost-ip == "10.85.136.41" then { Action (type="omfile" File="/var/log/rsyslog/dc2sfmsof_identity.log") }
If $fromhost-ip == "10.1.21.14" then { Action (type="omfile" File="/var/log/rsyslog/dc4stlmrs_identity.log") }
If $fromhost-ip == "10.55.55.10" then { Action (type="omfile" File="/var/log/rsyslog/dc3sdrdrs_identity.log") }
If $fromhost-ip == "10.57.29.11" then { Action (type="omfile" File="/var/log/rsyslog/dc2cblthv_identity.log") }
If $fromhost-ip == "10.44.44.10" then { Action (type="omfile" File="/var/log/rsyslog/dc2mtgbft_identity.log") }
If $fromhost-ip == "10.31.90.11" then { Action (type="omfile" File="/var/log/rsyslog/dc2sdmths_identity.log") }
If $fromhost-ip == "10.15.100.12" then { Action (type="omfile" File="/var/log/rsyslog/dc3etmmgl_identity.log") }
If $fromhost-ip == "10.60.224.4" then { Action (type="omfile" File="/var/log/rsyslog/dc3azcweu_identity.log") }
If $fromhost-ip == "10.60.224.5" then { Action (type="omfile" File="/var/log/rsyslog/dc2azcweu_identity.log") }
If $fromhost-ip == "10.27.20.10" then { Action (type="omfile" File="/var/log/rsyslog/dc1cpwthi_identity.log") }
If $fromhost-ip == "10.90.2.13" then { Action (type="omfile" File="/var/log/rsyslog/dc3bsmist_identity.log") }
If $fromhost-ip == "10.15.121.13" then { Action (type="omfile" File="/var/log/rsyslog/dc3sdmasp_identity.log") }
If $fromhost-ip == "10.86.20.12" then { Action (type="omfile" File="/var/log/rsyslog/dc3stmpnk_identity.log") }

# Microsoft Defender for Identity sensor - vionet.gr
If $fromhost-ip == "10.57.22.196" then { Action (type="omfile" File="/var/log/rsyslog/dc0vntinf_identity.log") }
If $fromhost-ip == "10.1.21.11" then { Action (type="omfile" File="/var/log/rsyslog/dc3vntmrs_identity.log") }
If $fromhost-ip == "10.1.21.12" then { Action (type="omfile" File="/var/log/rsyslog/dc4vntmrs_identity.log") }
If $fromhost-ip == "10.1.21.233" then { Action (type="omfile" File="/var/log/rsyslog/dc2vntmrs_identity.log") }
If $fromhost-ip == "10.60.224.6" then { Action (type="omfile" File="/var/log/rsyslog/dc3azpweu_identity.log") }

# F5 Load Balancer & WAF
If $fromhost-ip == "10.1.18.60" then { Action (type="omfile" File="/var/log/rsyslog/f5.log") }
If $fromhost-ip == "10.1.18.61" then { Action (type="omfile" File="/var/log/rsyslog/f5.log") }

# Checkpoint Firewall
If $fromhost-ip == "10.1.8.20" then { Action (type="omfile" File="/var/log/rsyslog/mrssec1.log") }
If $fromhost-ip == "10.1.8.21" then { Action (type="omfile" File="/var/log/rsyslog/mrssec2.log") }
If $fromhost-ip == "10.1.18.9" then { Action (type="omfile" File="/var/log/rsyslog/checkpoint_management_server.log" ) }
If $fromhost-ip == "10.1.18.10" then { Action (type="omfile" File="/var/log/rsyslog/checkpoint_node1.log" ) }
If $fromhost-ip == "10.1.18.11" then { Action (type="omfile" File="/var/log/rsyslog/checkpoint_node2.log" ) }
If $fromhost-ip == "10.1.18.12" then { Action (type="omfile" File="/var/log/rsyslog/checkpoint_cluster.log") }
If $fromhost-ip == "10.60.33.4" then { Action (type="omfile" File="/var/log/rsyslog/fortiAnalyzer.log") }

# FortiAnalyzer & VPN
If $fromhost-ip == "10.1.8.29" then { Action (type="omfile" File="/var/log/rsyslog/vpn_mrs.log") }
If $fromhost-ip == "10.1.20.191" then { Action (type="omfile" File="/var/log/rsyslog/fortiAnalyzer_node1.log") }
If $fromhost-ip == "10.1.20.192" then { Action (type="omfile" File="/var/log/rsyslog/fortiAnalyzer_node2.log") }

# Darktrace
If ($fromhost-ip == "10.57.117.130") then { Action (type="omfile" File="/var/log/rsyslog/darktrace.log") }

# IMSVA
If ($fromhost-ip == "10.1.16.68") then { Action (type="omfile" File="/var/log/rsyslog/imsva_node2.log") }
If ($fromhost-ip == "10.1.17.69") then { Action (type="omfile" File="/var/log/rsyslog/imsva_node1.log") }
# MOST POTENTIAL ENTRIES (DMZs)
If ($fromhost-ip == "172.16.1.68") then { Action (type="omfile" File="/var/log/rsyslog/imsva_ext_node2.log") }
If ($fromhost-ip == "172.16.1.69") then { Action (type="omfile" File="/var/log/rsyslog/imsva_ext_node1.log") }
If ($fromhost-ip == "195.167.93.69") then { Action (type="omfile" File="/var/log/rsyslog/imsva_external_node1.log") }
If ($fromhost-ip == "195.167.93.68") then { Action (type="omfile" File="/var/log/rsyslog/imsva_external_node2.log") }

# Cisco Routers
If $fromhost-ip == "10.15.119.1" then { Action (type="omfile" File="/var/log/rsyslog/Anamet_r.log") }
If $fromhost-ip == "10.15.99.1" then { Action (type="omfile" File="/var/log/rsyslog/Bianatt_r.log") }
If $fromhost-ip == "10.15.31.1" then { Action (type="omfile" File="/var/log/rsyslog/SdnAsp_r.log") }
If $fromhost-ip == "10.85.144.1" then { Action (type="omfile" File="/var/log/rsyslog/EtemBG_r.log") }
If $fromhost-ip == "10.85.9.50" then { Action (type="omfile" File="/var/log/rsyslog/SidmaBG_r.log") }
If $fromhost-ip == "10.15.85.1" then { Action (type="omfile" File="/var/log/rsyslog/Tavros_r.log") }
If $fromhost-ip == "10.15.100.1" then { Action (type="omfile" File="/var/log/rsyslog/Etem_r.log") }
If $fromhost-ip == "10.72.100.1" then { Action (type="omfile" File="/var/log/rsyslog/MareWest.log") }
If $fromhost-ip == "10.15.121.1" then { Action (type="omfile" File="/var/log/rsyslog/SidmaASP_r.log") }
If $fromhost-ip == "10.15.98.1" then { Action (type="omfile" File="/var/log/rsyslog/Simetal_r.log") }
If $fromhost-ip == "10.1.60.1" then { Action (type="omfile" File="/var/log/rsyslog/Vatondas_r.log") }
If $fromhost-ip == "10.42.42.1" then { Action (type="omfile" File="/var/log/rsyslog/Volos_r.log") }
If $fromhost-ip == "10.31.95.1" then { Action (type="omfile" File="/var/log/rsyslog/Aghialos_r.log") }
If $fromhost-ip == "10.25.213.1" then { Action (type="omfile" File="/var/log/rsyslog/Bitterfeld_r.log") }
If $fromhost-ip == "10.44.44.1" then { Action (type="omfile" File="/var/log/rsyslog/Byfleet_r.log") }
If $fromhost-ip == "10.25.127.1" then { Action (type="omfile" File="/var/log/rsyslog/Danube_r.log") }
If $fromhost-ip == "10.25.210.1" then { Action (type="omfile" File="/var/log/rsyslog/DeDsfTpm_r.log") }
If $fromhost-ip == "10.25.211.1" then { Action (type="omfile" File="/var/log/rsyslog/DeTpmHrt_r.log") }
If $fromhost-ip == "10.35.0.1" then { Action (type="omfile" File="/var/log/rsyslog/Voice_Dojran_r.log") }
If $fromhost-ip == "10.25.70.1" then { Action (type="omfile" File="/var/log/rsyslog/Valjevo_r.log") }
If $fromhost-ip == "10.31.31.1" then { Action (type="omfile" File="/var/log/rsyslog/Salonica_r.log") }
If $fromhost-ip == "10.72.255.254" then { Action (type="omfile" File="/var/log/rsyslog/Thisvi_r.log") }
If $fromhost-ip == "10.25.53.1" then { Action (type="omfile" File="/var/log/rsyslog/Sorou_r.log") }
If $fromhost-ip == "10.57.97.1" then { Action (type="omfile" File="/var/log/rsyslog/ElvThiva_r.log") }
If $fromhost-ip == "10.25.124.1" then { Action (type="omfile" File="/var/log/rsyslog/EtmBeograd_r.log") }
If $fromhost-ip == "10.25.212.1" then { Action (type="omfile" File="/var/log/rsyslog/Eutingen_r.log") }
If $fromhost-ip == "10.25.106.1" then { Action (type="omfile" File="/var/log/rsyslog/Fomentos_r.log") }
If $fromhost-ip == "10.1.61.1" then { Action (type="omfile" File="/var/log/rsyslog/Heraklion_r.log") }
If $fromhost-ip == "10.57.10.1" then { Action (type="omfile" File="/var/log/rsyslog/Inofita_r.log") }
If $fromhost-ip == "10.57.10.2" then { Action (type="omfile" File="/var/log/rsyslog/Inofita2_r.log") }
If $fromhost-ip == "10.31.120.1" then { Action (type="omfile" File="/var/log/rsyslog/Kalives_r.log") }
If $fromhost-ip == "10.31.108.1" then { Action (type="omfile" File="/var/log/rsyslog/Kalohori_r.log") }
If $fromhost-ip == "10.25.63.1" then { Action (type="omfile" File="/var/log/rsyslog/Lamia_r.log") }
If $fromhost-ip == "10.57.96.1" then { Action (type="omfile" File="/var/log/rsyslog/Levadia_r.log") }
If $fromhost-ip == "10.31.90.1" then { Action (type="omfile" File="/var/log/rsyslog/Oreokastro_r.log") }
If $fromhost-ip == "10.1.28.1" then { Action (type="omfile" File="/var/log/rsyslog/Pirgos_r.log") }
If $fromhost-ip == "10.82.191.1" then { Action (type="omfile" File="/var/log/rsyslog/RoIcme_r.log") }
If $fromhost-ip == "10.82.191.3" then { Action (type="omfile" File="/var/log/rsyslog/RoIcme2_r.log") }
If $fromhost-ip == "10.25.121.1" then { Action (type="omfile" File="/var/log/rsyslog/SdmTimisoara_r.log") }
If $fromhost-ip == "10.31.16.1" then { Action (type="omfile" File="/var/log/rsyslog/Skoumtza_r.log") }
If $fromhost-ip == "10.85.136.1" then { Action (type="omfile" File="/var/log/rsyslog/Sofiamed_r.log") }
If $fromhost-ip == "10.85.255.251" then { Action (type="omfile" File="/var/log/rsyslog/Stomana_r.log") }
If $fromhost-ip == "10.85.42.2" then { Action (type="omfile" File="/var/log/rsyslog/Stomana2_r.log") }
If $fromhost-ip == "10.57.255.252" then { Action (type="omfile" File="/var/log/rsyslog/Viokat_r.log") }
If $fromhost-ip == "10.1.255.247" then { Action (type="omfile" File="/var/log/rsyslog/Voice_Bridgnorth_r.log") }
If $fromhost-ip == "10.1.255.241" then { Action (type="omfile" File="/var/log/rsyslog/Voice_Fulgor_r.log") }
If $fromhost-ip == "10.55.255.254" then { Action (type="omfile" File="/var/log/rsyslog/Voice_Durres_r.log") }
If $fromhost-ip == "10.57.255.254" then { Action (type="omfile" File="/var/log/rsyslog/Voice_Inofita_r.log") }
If $fromhost-ip == "10.15.9.250" then { Action (type="omfile" File="/var/log/rsyslog/Voice_Etem_r.log") }
If $fromhost-ip == "10.1.255.254" then { Action (type="omfile" File="/var/log/rsyslog/Voice_Steelmet_r.log") }
If $fromhost-ip == "10.1.255.242" then { Action (type="omfile" File="/var/log/rsyslog/Voice_RiverWest_r.log") }
If $fromhost-ip == "10.85.255.253" then { Action (type="omfile" File="/var/log/rsyslog/Voice_SofiaMed_r.log") }
If $fromhost-ip == "10.31.255.254" then { Action (type="omfile" File="/var/log/rsyslog/Voice_Salonica_r.log") }
If $fromhost-ip == "10.25.102.1" then { Action (type="omfile" File="/var/log/rsyslog/EtmHania_r.log") }

# Core Switches
If $fromhost-ip == "10.15.21.1" then { Action (type="omfile" File="/var/log/rsyslog/crswtch1anmasp.log") }
If $fromhost-ip == "10.15.21.50" then { Action (type="omfile" File="/var/log/rsyslog/dcswtch1anmasp.log") }
If $fromhost-ip == "10.15.21.51" then { Action (type="omfile" File="/var/log/rsyslog/dcswtch2anmasp.log") }
If $fromhost-ip == "10.15.21.52" then { Action (type="omfile" File="/var/log/rsyslog/dcswtch3anmasp.log") }
If $fromhost-ip == "10.1.8.11" then { Action (type="omfile" File="/var/log/rsyslog/Steelmet-CoreSW-1.log") }
If $fromhost-ip == "10.1.8.12" then { Action (type="omfile" File="/var/log/rsyslog/Steelmet-CoreSW-2.log") }
If $fromhost-ip == "10.1.8.13"  then { Action (type="omfile" File="/var/log/rsyslog/Sidenor-CoreSW-1.log") }
If $fromhost-ip == "10.1.8.14"  then { Action (type="omfile" File="/var/log/rsyslog/Sidenor-CoreSW-2.log") }

# Access Switches
If $fromhost-ip == "10.15.21.10" then { Action (type="omfile" File="/var/log/rsyslog/swtch1anmasp.log") }
If $fromhost-ip == "10.15.21.11" then { Action (type="omfile" File="/var/log/rsyslog/swtch2anmasp.log") }
If $fromhost-ip == "10.15.21.12" then { Action (type="omfile" File="/var/log/rsyslog/swtch3anmasp.log") }
If $fromhost-ip == "10.15.21.14" then { Action (type="omfile" File="/var/log/rsyslog/swtch5anmasp.log") }
If $fromhost-ip == "10.15.21.15" then { Action (type="omfile" File="/var/log/rsyslog/swtch6anmasp.log") }
If $fromhost-ip == "10.15.21.16" then { Action (type="omfile" File="/var/log/rsyslog/swtch7anmasp.log") }
If $fromhost-ip == "10.15.21.17" then { Action (type="omfile" File="/var/log/rsyslog/swtch8anmasp.log") }
If $fromhost-ip == "10.15.21.20" then { Action (type="omfile" File="/var/log/rsyslog/swtch11anmasp.log") }
If $fromhost-ip == "10.15.21.21" then { Action (type="omfile" File="/var/log/rsyslog/swtch12anmasp.log") }
If $fromhost-ip == "10.15.21.26" then { Action (type="omfile" File="/var/log/rsyslog/swtch17anmasp.log") }
If $fromhost-ip == "10.1.18.50" then { Action (type="omfile" File="/var/log/rsyslog/C4006it.log") }
If $fromhost-ip == "10.1.18.52" then { Action (type="omfile" File="/var/log/rsyslog/C45K_Tafos1.log") }
If $fromhost-ip == "10.1.18.51" then { Action (type="omfile" File="/var/log/rsyslog/C45K_Tafos2.log") }
If $fromhost-ip == "10.25.106.5" then { Action (type="omfile" File="/var/log/rsyslog/Fomentos_s.log") }
If $fromhost-ip == "10.1.18.43" then { Action (type="omfile" File="/var/log/rsyslog/Kato_Tafos.log") }
If $fromhost-ip == "10.85.136.6" then { Action (type="omfile" File="/var/log/rsyslog/Sofiamed_s.log") }
If $fromhost-ip == "10.1.18.49" then { Action (type="omfile" File="/var/log/rsyslog/TelCom2960.corp.vionet.gr.log") }
If $fromhost-ip == "10.1.19.17" then { Action (type="omfile" File="/var/log/rsyslog/VioGate_s.log") }
If $fromhost-ip == "10.57.29.2" then { Action (type="omfile" File="/var/log/rsyslog/Viokat_s.log") }
If $fromhost-ip == "10.85.144.3" then { Action (type="omfile" File="/var/log/rsyslog/EtemBG_s.log") }
If $fromhost-ip == "10.1.19.71" then { Action (type="omfile" File="/var/log/rsyslog/StcFl1_2960x.log") }
If $fromhost-ip == "10.1.19.72" then { Action (type="omfile" File="/var/log/rsyslog/StcFl2_2960x.log") }
If $fromhost-ip == "10.15.99.3" then { Action (type="omfile" File="/var/log/rsyslog/bianatt_sw2.log") }
If $fromhost-ip == "10.15.100.24" then { Action (type="omfile" File="/var/log/rsyslog/etm_main_switch.log") }
If $fromhost-ip == "10.15.100.233" Then { Action (type="omfile" File="/var/log/rsyslog/etm_k1_switch.log") }
If $fromhost-ip == "10.15.100.238" Then { Action (type="omfile" File="/var/log/rsyslog/etm_main_backbone.log") }

# Management Interfaces for Servers
If $fromhost-ip == "10.15.23.4" then { Action (type="omfile" File="/var/log/rsyslog/mngmt2anmasp.log") }
If $fromhost-ip == "10.15.23.5" then { Action (type="omfile" File="/var/log/rsyslog/mngmt3anmasp.log") }
If $fromhost-ip == "10.15.23.6" then { Action (type="omfile" File="/var/log/rsyslog/mngmt4anmasp.log") }
If $fromhost-ip == "10.15.23.7" then { Action (type="omfile" File="/var/log/rsyslog/mngmt5anmasp.log") }
If $fromhost-ip == "10.15.23.8" then { Action (type="omfile" File="/var/log/rsyslog/mngmt6anmasp.log") }
If $fromhost-ip == "10.15.23.9" then { Action (type="omfile" File="/var/log/rsyslog/mngmt7anmasp.log") }
If $fromhost-ip == "10.15.23.12" then { Action (type="omfile" File="/var/log/rsyslog/mngmt10anmasp.log") }
If $fromhost-ip == "10.15.23.10" then { Action (type="omfile" File="/var/log/rsyslog/mngmt8anmasp.log") }
If $fromhost-ip == "10.15.23.11" then { Action (type="omfile" File="/var/log/rsyslog/mngmt9anmasp.log") }

If $fromhost-ip == "10.1.21.101" then { Action (type="omfile" File="/var/log/rsyslog/xclarity_administrator.log") }

# UPSes
If $fromhost-ip == "10.15.23.194" then { Action (type="omfile" File="/var/log/rsyslog/ups1anmasp.log") }
If $fromhost-ip == "10.15.23.195" then { Action (type="omfile" File="/var/log/rsyslog/ups2anmasp.log") }
#If $fromhost-ip == "10.15.23.196" then { Action (type="omfile" File="/var/log/rsyslog/ups3anmasp.log") }
If $fromhost-ip == "10.15.23.197" then { Action (type="omfile" File="/var/log/rsyslog/ups4anmasp.log") }
If $fromhost-ip == "10.15.23.198" then { Action (type="omfile" File="/var/log/rsyslog/ups5anmasp.log") }
#If $fromhost-ip == "10.15.23.199" then { Action (type="omfile" File="/var/log/rsyslog/ups6anmasp.log") }
If $fromhost-ip == "10.15.23.200" then { Action (type="omfile" File="/var/log/rsyslog/ups7anmasp.log") }
#If $fromhost-ip == "10.15.23.201" then { Action (type="omfile" File="/var/log/rsyslog/ups8anmasp.log") }
If $fromhost-ip == "10.15.23.202" then { Action (type="omfile" File="/var/log/rsyslog/ups9anmasp.log") }
If $fromhost-ip == "10.15.23.203" then { Action (type="omfile" File="/var/log/rsyslog/ups10anmasp.log") }
#If $fromhost-ip == "10.15.23.204" then { Action (type="omfile" File="/var/log/rsyslog/ups11anmasp.log") }
#If $fromhost-ip == "10.15.23.205" then { Action (type="omfile" File="/var/log/rsyslog/ups12anmasp.log") }
#If $fromhost-ip == "10.15.23.206" then { Action (type="omfile" File="/var/log/rsyslog/ups13anmasp.log") }
#If $fromhost-ip == "10.15.23.207" then { Action (type="omfile" File="/var/log/rsyslog/ups14anmasp.log") }
#If $fromhost-ip == "10.15.23.208" then { Action (type="omfile" File="/var/log/rsyslog/ups15anmasp.log") }

# Printers
If $fromhost-ip == "10.15.22.140" then { Action (type="omfile" File="/var/log/rsyslog/prnt1anmasp.log") }
If $fromhost-ip == "10.15.22.157" then { Action (type="omfile" File="/var/log/rsyslog/prnt18anmasp.log") }

If $fromhost-ip == "10.1.33.38" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn001.log") }
If $fromhost-ip == "10.1.33.3" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn002.log") }
If $fromhost-ip == "10.1.33.4" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn003.log") }
If $fromhost-ip == "10.1.33.5" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn004.log") }
If $fromhost-ip == "10.1.33.7" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn005.log") }
If $fromhost-ip == "10.1.33.9" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn006.log") }
If $fromhost-ip == "10.1.33.11" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn007.log") }
If $fromhost-ip == "10.1.33.12" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn008.log") }
If $fromhost-ip == "10.1.33.13" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn009.log") }
If $fromhost-ip == "10.1.33.14" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn010.log") }
If $fromhost-ip == "10.1.33.15" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn011.log") }
If $fromhost-ip == "10.1.33.16" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn012.log") }
If $fromhost-ip == "10.1.33.19" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn013.log") }
If $fromhost-ip == "10.1.33.20" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn014.log") }
If $fromhost-ip == "10.1.33.26" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn015.log") }
If $fromhost-ip == "10.1.33.8" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn016.log") }
If $fromhost-ip == "10.1.33.37" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn017.log") }
If $fromhost-ip == "10.1.33.39" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn018.log") }
If $fromhost-ip == "10.1.33.40" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn019.log") }
If $fromhost-ip == "10.1.33.41" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn020.log") }
If $fromhost-ip == "10.1.33.42" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn021.log") }
If $fromhost-ip == "10.1.33.43" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn022.log") }
If $fromhost-ip == "10.17.20.51" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn023.log") }
If $fromhost-ip == "10.1.33.10" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn024.log") }
If $fromhost-ip == "10.1.33.17" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn025.log") }
If $fromhost-ip == "10.1.33.44" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn026.log") }
If $fromhost-ip == "10.1.33.28" then { Action (type="omfile" File="/var/log/rsyslog/stgrcdtppprn027.log") }

If $fromhost-ip == "10.25.53.20" then { Action (type="omfile" File="/var/log/rsyslog/hpgrcdtppprn001.log") }

If $fromhost-ip == "10.1.33.27" then { Action (type="omfile" File="/var/log/rsyslog/vxgrcdtppprn001.log") }

If $fromhost-ip == "10.1.81.81" then { Action (type="omfile" File="/var/log/rsyslog/nlgrcdtppprn001.log") }
If $fromhost-ip == "10.1.81.82" then { Action (type="omfile" File="/var/log/rsyslog/nlgrcdtppprn002.log") }
If $fromhost-ip == "10.1.81.83" then { Action (type="omfile" File="/var/log/rsyslog/nlgrcdtppprn003.log") }
If $fromhost-ip == "10.1.81.84" then { Action (type="omfile" File="/var/log/rsyslog/nlgrcdtppprn004.log") }
If $fromhost-ip == "10.25.16.51" then { Action (type="omfile" File="/var/log/rsyslog/nlgrcdtppprn005.log") }


# Log anything (except mail) of level info or higher.
# Don't log private authentication messages!
*.info;mail.none;authpriv.none;cron.none                /var/log/messages

# The authpriv file has restricted access.
authpriv.*                                              /var/log/secure

# Log all the mail messages in one place.
mail.*                                                  -/var/log/maillog


# Log cron stuff
cron.*                                                  /var/log/cron

# Everybody gets emergency messages
*.emerg                                                 :omusrmsg:*

# Save news errors of level crit and higher in a special file.
uucp,news.crit                                          /var/log/spooler

# Save boot messages also to boot.log
local7.*                                                /var/log/boot.log
'@
        
$logrotateRsyslog = @'
/var/log/rsyslog/*.log{
    hourly
    size 10M
    rotate 5
    missingok
    compress
    nodelaycompress
    sharedscripts
    postrotate
        /usr/bin/systemctl reload-or-try-restart rsyslog;/usr/bin/mv /var/log/rsyslog/*.*[0-9] /var/log/rsyslog/archives/
    endscript
}
'@

$forwardF5 = @'
$InputFilePollInterval 10
$InputFileName /var/log/rsyslog/f5.log
$InputFileTag f5-log:
$InputFileStateFile stat-f5
$InputFileSeverity Info
$InputRunFileMonitor

$template f5-log, " %msg% "

if $programname == 'f5-log' then @10.60.228.17:517;f5-log
if $programname == 'f5-log' then stop
'@

$forwardCheckpoint = @'
$InputFilePollInterval 10
$InputFileName /var/log/rsyslog/checkpoint_management_server.log
$InputFileTag checkpoint-log:
$InputFileStateFile stat-checkpoint-access
$InputFileSeverity Info
$InputRunFileMonitor

$template checkpoint-log, " %msg% "

if $programname == 'checkpoint-log' then @10.60.228.17:516;checkpoint-log
if $programname == 'checkpoint-log' then stop
'@

$forwardFortianalyzer = @'
$InputFilePollInterval 10
$InputFileName /var/log/rsyslog/fortiAnalyzer.log
$InputFileTag fortianalyzer-log:
$InputFileStateFile stat-fortianalyzer-access
$InputFileSeverity Info
$InputRunFileMonitor

$template fortianalyzer-log, " %msg% "

if $programname == 'fortianalyzer-log' then @10.60.228.17:515;fortianalyzer-log
if $programname == 'fortianalyzer-log' then stop
'@

$forwardDarktrace = @'
$InputFilePollInterval 10
$InputFileName /var/log/rsyslog/darktrace.log
$InputFileTag darktrace-log:
$InputFileStateFile stat-darktrace-access
$InputFileSeverity Info
$InputRunFileMonitor

$template darktrace-log, " %msg% "

if $programname == 'darktrace-log' then @10.60.228.17:514;darktrace-log
if $programname == 'darktrace-log' then stop
'@

$crontab = @'
0 * * * * /usr/bin/rm -f /var/log/rsyslog/archives/*
0,15,30,45 * * * * /usr/sbin/logrotate /etc/logrotate.d/rsyslog
0,15,30,45 * * * * /usr/sbin/logrotate /etc/logrotate.d/syslog
0 21 * * *  

'@

$configureCrontabGetScript = @'
#!/bin/bash
/usr/bin/crontab -l -u root
'@

$configureCrontabTestScript = @'
#!/bin/bash
/usr/bin/crontab -l -u root > /tmp/currentCrontabContents.txt
CRONTABCHANGES=$(diff /tmp/currentCrontabContents.txt /root/dsc/desiredCrontabContents.txt)
rm -f /tmp/currentCrontabContents.txt
if [ "$CRONTABCHANGES" != "" ]
then
	exit 1
else
	exit 0
fi 
'@

$configureCrontabSetScript = @'
#!/bin/bash
/usr/bin/crontab -u root /root/dsc/desiredCrontabContents.txt
'@

$configureMsRepoGetScript = @'
#!/bin/bash
test -f /etc/yum.repos.d/microsoft-prod.repo
'@

$configureMsRepoTestScript = @'
#!/bin/bash
msrepo=/etc/yum.repos.d/microsoft-prod.repo
if [ -f $msrepo ]
then
	exit 0
else
	exit 1
    fi
'@

$configureMsRepoSetScript = @'
#!/bin/bash
/usr/bin/sudo /usr/bin/rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
'@

        $rsyslogConf = LinuxString $rsyslogConf
        $logrotateRsyslog = LinuxString $logrotateRsyslog
        $forwardF5 = LinuxString $forwardF5  
        $forwardCheckpoint = LinuxString $forwardCheckpoint
        $forwardFortianalyzer = LinuxString $forwardFortianalyzer
        $forwardDarktrace = LinuxString $forwardDarktrace
        $crontab = LinuxString $crontab 
        $configureCrontabGetScript = LinuxString $configureCrontabGetScript
        $configureCrontabTestScript = LinuxString $configureCrontabTestScript
        $configureCrontabSetScript = LinuxString $configureCrontabSetScript
        $configureMsRepoGetScript = LinuxString $configureMsRepoGetScript 
        $configureMsRepoTestScript = LinuxString $configureMsRepoTestScript
        $configureMsRepoSetScript = LinuxString $configureMsRepoSetScript

        nxPackage rsyslog
        {
            Name              = 'rsyslog'
            Ensure            = 'Present'
            PackageManager    = 'Yum'
        }

        nxPackage tree
        {
            Name              = 'tree'
            Ensure            = 'Present'
            PackageManager    = 'Yum'
        }

        nxPackage wget
        {
            Name              = 'wget'
            Ensure            = 'Present'
            PackageManager    = 'Yum'
        }

        nxFile rsyslogConfiguration
        {
            DestinationPath = "/etc/rsyslog.conf"
            Mode = "644"
            Type = "file"
            Contents = $rsyslogConf
            DependsOn = "[nxPackage]rsyslog"
        }

        nxService rsyslogService 
        {
            Name = "rsyslog"
            Controller = "systemd"
            Enabled = $true
            State = "Running"
            DependsOn = "[nxFile]rsyslogConfiguration"
        }

        nxFile logrotateRsyslogConfiguration
        {
            DestinationPath = "/etc/logrotate.d/rsyslog"
            Mode = "644"
            Type = "file"
            Contents = $logrotateRsyslog
            DependsOn = "[nxService]rsyslogService"
        }

        nxFile rsyslogForwardF5
        {
            DestinationPath = "/etc/rsyslog.d/101-f5.conf"
            Mode = "644"
            Type = "file"
            Contents = $forwardF5
            DependsOn = "[nxService]rsyslogService"
        }

        nxFile rsyslogForwardCheckpoint
        {
            DestinationPath = "/etc/rsyslog.d/97-checkpoint.conf"
            Mode = "644"
            Type = "file"
            Contents = $forwardCheckpoint
            DependsOn = "[nxService]rsyslogService"
        }

        nxFile rsyslogForwardFortianalyzer
        {
            DestinationPath = "/etc/rsyslog.d/98-fortianalyzer.conf"
            Mode = "644"
            Type = "file"
            Contents = $forwardFortianalyzer
            DependsOn = "[nxService]rsyslogService"
        }

        nxFile rsyslogForwardDarktrace
        {
            DestinationPath = "/etc/rsyslog.d/99-darktrace.conf"
            Mode = "644"
            Type = "file"
            Contents = $forwardDarktrace
            DependsOn = "[nxService]rsyslogService"
        }

        nxFile crontabDirectory
        {
            Ensure = "Present"
            DestinationPath = "/root/dsc"
            Mode = "755"
            Type = "Directory"
            DependsOn = "[nxService]rsyslogService"
        } 

        nxFile contabContents
        {
            Ensure = "Present"
            DestinationPath = "/root/dsc/desiredCrontabContents.txt"
            Mode = "644"
            Type = "File"
            Contents = $crontab
            DependsOn = "[nxFile]crontabDirectory"
        }

        nxScript configureCrontab 
        {
            GetScript = $configureCrontabGetScript 
            SetScript = $configureCrontabSetScript
            TestScript = $configureCrontabTestScript 
            DependsOn = "[nxFile]contabContents"
        }

        nxScript configureMsRepo 
        {
            GetScript = $configureMsRepoGetScript 
            SetScript = $configureMsRepoSetScript
            TestScript = $configureMsRepoTestScript 
        }

        nxPackage dsc
        {
            Name              = 'dsc'
            Ensure            = 'Present'
            PackageManager    = 'Yum'
            DependsOn = "[nxScript]configureMsRepo"
        }

        nxPackage powershell
        {
            Name              = 'powershell'
            Ensure            = 'Present'
            PackageManager    = 'Yum'
            DependsOn = "[nxScript]configureMsRepo"
        }

        nxPackage omi
        {
            Name              = 'omi'
            Ensure            = 'Present'
            PackageManager    = 'Yum'
            DependsOn = "[nxScript]configureMsRepo"
        }

    }

    Node IsNotPresent
    {
        nxPackage rsyslog
        {
            Name              = 'rsyslog'
            Ensure            = 'Absent'
        }
    }
}