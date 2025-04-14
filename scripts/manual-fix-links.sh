#!/bin/bash

# Manually fix source links in Org files using Org mode link syntax
echo "Manually fixing source links in key files..."

# Create backups - just in case
mkdir -p /tmp/essays-backup
cp /Users/zeeshankhan/ftgn-journalism/content/essays/*.org /tmp/essays-backup/

# Kunduz 2015
cat > /Users/zeeshankhan/ftgn-journalism/content/essays/38-29-Kunduz-2015.org << 'EOL'
#+TITLE: Kunduz
#+DATE: 2015-01-01
#+HUGO_BASE_DIR: ../../
#+HUGO_SECTION: essays
#+HUGO_TAGS: Civilians
#+HUGO_CATEGORIES: Afghanistan War
#+EXPORT_FILE_NAME: 38-29-Kunduz-2015
#+LOCATION: Afghanistan
#+YEAR: 2015

Dr. Esmatullah Esmat was on duty at the Médecins Sans Frontières trauma center in Kunduz when the first bombs hit. For 30 minutes, AC-130 gunship bombardment rained down on the facility. Despite clearly marked roofs with the MSF logo, the U.S. airstrikes continued, forcing staff and patients—including immobile ICU patients—to flee in terror.

Dr. Esmat recalled watching patients burn in their beds and colleagues riddled with shrapnel. Forty-two people were killed, including 14 MSF staff members. The hospital, which had treated thousands of wounded Afghans regardless of affiliation, was destroyed.

The U.S. military later called the attack a tragic mistake stemming from misidentification, eventually paying $6,000 to each family who lost a loved one.

**Source:** [[https://www.msf.org/kunduz-hospital-attack-depth][Doctors Without Borders]]

* Sources
:PROPERTIES:
:EXPORT_EXCLUDE: t
:END:
EOL
echo "Fixed 38-29-Kunduz-2015.org"

# Sanaa 2025
cat > /Users/zeeshankhan/ftgn-journalism/content/essays/52-45-Sanaa-2025.org << 'EOL'
#+TITLE: Sanaa
#+DATE: 2025-01-01
#+HUGO_BASE_DIR: ../../
#+HUGO_SECTION: essays
#+HUGO_TAGS: Civilians
#+HUGO_CATEGORIES: Yemen War
#+EXPORT_FILE_NAME: 52-45-Sanaa-2025
#+LOCATION: Yemen
#+YEAR: 2025

In the wake of the 2025 escalation, eight-year-old Mohammad Al-Qadasi was playing in his family's courtyard when U.S. airstrikes targeted nearby military installations in the Yemeni capital of Sanaa. The blast shattered windows throughout his neighborhood and sent debris flying into residential areas.

Mohammad's family sought treatment at a hospital supported by Médecins Sans Frontières, where doctors worked under challenging conditions to treat over 200 civilians injured in the bombardment. Power outages forced medical teams to rely on generators while dealing with shortages of essential supplies.  

The air campaign, aimed at Houthi military targets, faced criticism for its impact on civilians and key infrastructure in densely populated areas like Sanaa.

**Source:** [[https://www.msf.org/reports-from-yemen-2025-crisis][MSF/Doctors Without Borders]]

* Sources
:PROPERTIES:
:EXPORT_EXCLUDE: t
:END:
EOL
echo "Fixed 52-45-Sanaa-2025.org"

# Rouen 1944
cat > /Users/zeeshankhan/ftgn-journalism/content/essays/01-42-Rouen-1944.org << 'EOL'
#+TITLE: Rouen
#+DATE: 1944-01-01
#+HUGO_BASE_DIR: ../../
#+HUGO_SECTION: essays
#+HUGO_TAGS: Civilians
#+HUGO_CATEGORIES: World War II
#+EXPORT_FILE_NAME: 01-42-Rouen-1944
#+LOCATION: Germany
#+YEAR: 1944

In April 1944, weeks before D-Day, the U.S. Army Air Forces launched a bombing raid over Rouen aimed at disrupting German logistics. The bombing inadvertently struck several civilian areas.

Jean-Claude Ruel, then a teenager, was caught in the open during the attack. His younger sister was killed instantly by a collapsing wall. Ruel survived by hiding in a ditch but carried shrapnel injuries into adulthood.

The bombing campaign, part of the broader Allied strategy to liberate France, caused significant destruction and civilian casualties in occupied cities like Rouen. While ultimately aiding the defeat of Nazi Germany, these operations left lasting scars among French civilians.

**Source:** [[https://www.france24.com/en/france/20200605-wwii-anniversary-the-forgotten-french-victims-of-allied-bombing][France24]]

* Sources
:PROPERTIES:
:EXPORT_EXCLUDE: t
:END:
EOL
echo "Fixed 01-42-Rouen-1944.org"

# My Lai 1968 (special case example)
cat > /Users/zeeshankhan/ftgn-journalism/content/essays/11-35-My-Lai-1968.org << 'EOL'
#+TITLE: My Lai
#+DATE: 1968-01-01
#+HUGO_BASE_DIR: ../../
#+HUGO_SECTION: essays
#+HUGO_TAGS: Civilians
#+HUGO_CATEGORIES: Vietnam War
#+EXPORT_FILE_NAME: 11-35-My-Lai-1968
#+LOCATION: Vietnam
#+YEAR: 1968


Although not a traditional bombing campaign, My Lai was the site of one of the Vietnam War's worst atrocities. U.S. troops, under the command of Lt. William Calley, massacred over 500 unarmed civilians. 

Do Ba, 10 years old, hid in a ditch with his younger sister. He watched soldiers execute his neighbors at close range. A helicopter crew—Warrant Officer Hugh Thompson and his gunners—landed amid the chaos and stopped further killings by threatening their fellow Americans.

Do Ba survived and later testified before Vietnamese and foreign investigators.

**Source:** [[https://www.pbs.org/wgbh/americanexperience/films/mylai/][Peabody Award-winning PBS Documentary]]

* Sources
:PROPERTIES:
:EXPORT_EXCLUDE: t
:END:
EOL
echo "Fixed 11-35-My-Lai-1968.org"

echo "Manual fixes complete. Please check the site to see the changes."