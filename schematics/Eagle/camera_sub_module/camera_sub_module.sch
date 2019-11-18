<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.6.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="yes" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="ArduCAM_OV2640">
<packages>
<package name="MOTOR">
<description>Gauge stepper motor</description>
<circle x="0" y="0" radius="15" width="0.127" layer="21"/>
<circle x="-13.5" y="0" radius="1.25" width="0.127" layer="45"/>
<circle x="0" y="10.33" radius="1.85" width="0.127" layer="45"/>
<circle x="0" y="6.54" radius="1" width="0.127" layer="45"/>
<circle x="13.5" y="0" radius="1.25" width="0.127" layer="45"/>
<circle x="8.7" y="-8.7" radius="1.25" width="0.127" layer="45"/>
<pad name="P$1" x="-25.362" y="-1.858" drill="2.5"/>
<pad name="P$2" x="-24.93" y="0.602" drill="2.5"/>
<pad name="P$3" x="-25.336" y="-2.604" drill="2.5"/>
<pad name="P$4" x="12.5" y="4" drill="0.5"/>
<pad name="P$5" x="12.5" y="-4" drill="0.5"/>
<pad name="P$6" x="-12.5" y="4" drill="0.5"/>
<pad name="P$7" x="-12.5" y="-4" drill="0.5"/>
<pad name="P$8" x="-24.892" y="4.742" drill="3.7"/>
</package>
</packages>
<symbols>
<symbol name="MOTOR">
<wire x1="-2.54" y1="0" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="5.08" y2="0" width="0.254" layer="94"/>
<wire x1="5.08" y1="0" x2="7.62" y2="0" width="0.254" layer="94"/>
<wire x1="7.62" y1="0" x2="10.16" y2="0" width="0.254" layer="94"/>
<wire x1="10.16" y1="0" x2="12.7" y2="0" width="0.254" layer="94"/>
<wire x1="12.7" y1="0" x2="15.24" y2="0" width="0.254" layer="94"/>
<wire x1="15.24" y1="0" x2="17.78" y2="0" width="0.254" layer="94"/>
<wire x1="17.78" y1="0" x2="20.16" y2="0" width="0.254" layer="94"/>
<wire x1="20.16" y1="0" x2="20.16" y2="10" width="0.254" layer="94"/>
<wire x1="20.16" y1="10" x2="-2.54" y2="10" width="0.254" layer="94"/>
<wire x1="-2.54" y1="10" x2="-2.54" y2="0" width="0.254" layer="94"/>
<text x="0.668" y="0.5" size="1.27" layer="95" rot="R90">CS</text>
<text x="3.176" y="0.5" size="1.27" layer="95" rot="R90">MOSI</text>
<text x="5.938" y="0.5" size="1.27" layer="95" rot="R90">MISO</text>
<text x="8.446" y="0.5" size="1.27" layer="95" rot="R90">SCLK</text>
<text x="1.884" y="10.5" size="1.27" layer="95">AdruCAM OV2640</text>
<text x="10.986" y="0.5" size="1.27" layer="95" rot="R90">GND</text>
<wire x1="0" y1="0" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="5.08" y1="0" x2="5.08" y2="-2.54" width="0.254" layer="94"/>
<wire x1="7.62" y1="0" x2="7.62" y2="-2.54" width="0.254" layer="94"/>
<wire x1="10.16" y1="0" x2="10.16" y2="-2.54" width="0.254" layer="94"/>
<wire x1="12.7" y1="0" x2="12.7" y2="-2.54" width="0.254" layer="94"/>
<wire x1="15.24" y1="0" x2="15.24" y2="-2.54" width="0.254" layer="94"/>
<wire x1="17.78" y1="0" x2="17.78" y2="-2.54" width="0.254" layer="94"/>
<text x="13.526" y="0.5" size="1.27" layer="95" rot="R90">+Vcc</text>
<text x="16.066" y="0.5" size="1.27" layer="95" rot="R90">SDA</text>
<text x="18.606" y="0.5" size="1.27" layer="95" rot="R90">SCL</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="MOTOR">
<gates>
<gate name="G$1" symbol="MOTOR" x="-2.54" y="2.54"/>
</gates>
<devices>
<device name="" package="MOTOR">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="+3V3">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+3V3" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="+3V3" prefix="+3V3">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="+3V3" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U$1" library="ArduCAM_OV2640" deviceset="MOTOR" device=""/>
<part name="+3V1" library="supply1" deviceset="+3V3" device=""/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="25.4" y="63.5"/>
<instance part="+3V1" gate="G$1" x="58.42" y="78.74"/>
<instance part="GND1" gate="1" x="58.42" y="33.02"/>
</instances>
<busses>
</busses>
<nets>
<net name="+3V3" class="0">
<segment>
<wire x1="38.1" y1="60.96" x2="38.1" y2="55.88" width="0.1524" layer="91"/>
<wire x1="38.1" y1="55.88" x2="58.42" y2="55.88" width="0.1524" layer="91"/>
<pinref part="+3V1" gate="G$1" pin="+3V3"/>
<wire x1="58.42" y1="55.88" x2="58.42" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="25.4" y1="60.96" x2="25.4" y2="58.42" width="0.1524" layer="91"/>
<wire x1="25.4" y1="58.42" x2="2.54" y2="58.42" width="0.1524" layer="91"/>
<label x="2.54" y="58.42" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<wire x1="27.94" y1="60.96" x2="27.94" y2="53.34" width="0.1524" layer="91"/>
<wire x1="27.94" y1="53.34" x2="2.54" y2="53.34" width="0.1524" layer="91"/>
<label x="2.54" y="53.34" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<wire x1="30.48" y1="60.96" x2="30.48" y2="48.26" width="0.1524" layer="91"/>
<wire x1="30.48" y1="48.26" x2="2.54" y2="48.26" width="0.1524" layer="91"/>
<label x="2.54" y="48.26" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="33.02" y1="60.96" x2="33.02" y2="43.18" width="0.1524" layer="91"/>
<wire x1="33.02" y1="43.18" x2="2.54" y2="43.18" width="0.1524" layer="91"/>
<label x="2.54" y="43.18" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="SDA1(PIN96)" class="0">
<segment>
<wire x1="40.64" y1="60.96" x2="40.64" y2="38.1" width="0.1524" layer="91"/>
<wire x1="40.64" y1="38.1" x2="2.54" y2="38.1" width="0.1524" layer="91"/>
<label x="2.54" y="38.1" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="SCL1(PIN95)" class="0">
<segment>
<wire x1="43.18" y1="60.96" x2="43.18" y2="33.02" width="0.1524" layer="91"/>
<wire x1="43.18" y1="33.02" x2="2.54" y2="33.02" width="0.1524" layer="91"/>
<label x="2.54" y="33.02" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<wire x1="35.56" y1="60.96" x2="35.56" y2="48.26" width="0.1524" layer="91"/>
<wire x1="35.56" y1="48.26" x2="58.42" y2="48.26" width="0.1524" layer="91"/>
<pinref part="GND1" gate="1" pin="GND"/>
<wire x1="58.42" y1="48.26" x2="58.42" y2="35.56" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
