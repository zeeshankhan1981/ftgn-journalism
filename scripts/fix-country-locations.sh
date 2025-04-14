#!/bin/bash

# Script to fix country locations in Org files
# This will update the LOCATION field to use proper country names

echo "Fixing country locations in essay files..."

# Create a temporary backup
mkdir -p /tmp/essays-backup-$(date +%Y%m%d%H%M%S)
cp /Users/zeeshankhan/ftgn-journalism/content/essays/*.org /tmp/essays-backup-$(date +%Y%m%d%H%M%S)/

# World War II locations
sed -i "" 's/#+LOCATION: Rouen/#+LOCATION: France/' /Users/zeeshankhan/ftgn-journalism/content/essays/01-42-Rouen-1944.org
sed -i "" 's/#+LOCATION: Dresden/#+LOCATION: Germany/' /Users/zeeshankhan/ftgn-journalism/content/essays/02-13-Dresden-1945.org
sed -i "" 's/#+LOCATION: Hiroshima/#+LOCATION: Japan/' /Users/zeeshankhan/ftgn-journalism/content/essays/03-19-Hiroshima-1945.org
sed -i "" 's/#+LOCATION: Nagasaki/#+LOCATION: Japan/' /Users/zeeshankhan/ftgn-journalism/content/essays/04-36-Nagasaki-1945.org
sed -i "" 's/#+LOCATION: Tokyo/#+LOCATION: Japan/' /Users/zeeshankhan/ftgn-journalism/content/essays/05-49-Tokyo-1945.org

# Korean War locations
sed -i "" 's/#+LOCATION: Pyongyang/#+LOCATION: North Korea/' /Users/zeeshankhan/ftgn-journalism/content/essays/06-40-Pyongyang-1950.org
sed -i "" 's/#+LOCATION: Wonsan/#+LOCATION: North Korea/' /Users/zeeshankhan/ftgn-journalism/content/essays/07-52-Wonsan-1951.org

# Vietnam War locations
sed -i "" 's/#+LOCATION: Hanoi/#+LOCATION: Vietnam/' /Users/zeeshankhan/ftgn-journalism/content/essays/08-18-Hanoi-1965.org
sed -i "" 's/#+LOCATION: Hue/#+LOCATION: Vietnam/' /Users/zeeshankhan/ftgn-journalism/content/essays/09-21-Hue-1968.org
sed -i "" 's/#+LOCATION: Khe Sanh/#+LOCATION: Vietnam/' /Users/zeeshankhan/ftgn-journalism/content/essays/10-26-Khe-Sanh-1968.org
sed -i "" 's/#+LOCATION: My Lai/#+LOCATION: Vietnam/' /Users/zeeshankhan/ftgn-journalism/content/essays/11-35-My-Lai-1968.org
sed -i "" 's/#+LOCATION: Saigon/#+LOCATION: Vietnam/' /Users/zeeshankhan/ftgn-journalism/content/essays/12-44-Saigon-1968.org
sed -i "" 's/#+LOCATION: Haiphong/#+LOCATION: Vietnam/' /Users/zeeshankhan/ftgn-journalism/content/essays/13-17-Haiphong-1972.org

# Granada
sed -i "" 's/#+LOCATION: Granada/#+LOCATION: Grenada/' /Users/zeeshankhan/ftgn-journalism/content/essays/14-15-Granada-1983.org

# Libya locations
sed -i "" 's/#+LOCATION: Benghazi/#+LOCATION: Libya/' /Users/zeeshankhan/ftgn-journalism/content/essays/15-10-Benghazi-1986.org
sed -i "" 's/#+LOCATION: Tripoli/#+LOCATION: Libya/' /Users/zeeshankhan/ftgn-journalism/content/essays/16-51-Tripoli-1986.org

# Panama
sed -i "" 's/#+LOCATION: Panama City/#+LOCATION: Panama/' /Users/zeeshankhan/ftgn-journalism/content/essays/17-38-Panama-City-1989.org

# Iraq (Gulf War)
sed -i "" 's/#+LOCATION: Baghdad/#+LOCATION: Iraq/' /Users/zeeshankhan/ftgn-journalism/content/essays/18-04-Baghdad-1991.org
sed -i "" 's/#+LOCATION: Basra/#+LOCATION: Iraq/' /Users/zeeshankhan/ftgn-journalism/content/essays/19-08-Basra-1991.org

# Kosovo War
sed -i "" 's/#+LOCATION: Belgrade/#+LOCATION: Serbia/' /Users/zeeshankhan/ftgn-journalism/content/essays/20-09-Belgrade-1999.org
sed -i "" 's/#+LOCATION: Pristina/#+LOCATION: Kosovo/' /Users/zeeshankhan/ftgn-journalism/content/essays/21-39-Pristina-1999.org

# Afghanistan War locations
sed -i "" 's/#+LOCATION: Derunta/#+LOCATION: Afghanistan/' /Users/zeeshankhan/ftgn-journalism/content/essays/22-12-Derunta-2001.org
sed -i "" 's/#+LOCATION: Jalalabad/#+LOCATION: Afghanistan/' /Users/zeeshankhan/ftgn-journalism/content/essays/23-22-Jalalabad-2001.org
sed -i "" 's/#+LOCATION: Kabul/#+LOCATION: Afghanistan/' /Users/zeeshankhan/ftgn-journalism/content/essays/24-23-Kabul-2001.org
sed -i "" 's/#+LOCATION: Kandahar/#+LOCATION: Afghanistan/' /Users/zeeshankhan/ftgn-journalism/content/essays/25-24-Kandahar-2001.org
sed -i "" 's/#+LOCATION: Mazar I Sharif/#+LOCATION: Afghanistan/' /Users/zeeshankhan/ftgn-journalism/content/essays/26-32-Mazar-i-Sharif-2001.org
sed -i "" 's/#+LOCATION: Tora Bora/#+LOCATION: Afghanistan/' /Users/zeeshankhan/ftgn-journalism/content/essays/27-50-Tora-Bora-2001.org
sed -i "" 's/#+LOCATION: Khost/#+LOCATION: Afghanistan/' /Users/zeeshankhan/ftgn-journalism/content/essays/28-27-Khost-2002.org
sed -i "" 's/#+LOCATION: Kunduz/#+LOCATION: Afghanistan/' /Users/zeeshankhan/ftgn-journalism/content/essays/38-29-Kunduz-2015.org

# Iraq War
sed -i "" 's/#+LOCATION: Baghdad/#+LOCATION: Iraq/' /Users/zeeshankhan/ftgn-journalism/content/essays/29-05-Baghdad-2003.org
sed -i "" 's/#+LOCATION: Fallujah/#+LOCATION: Iraq/' /Users/zeeshankhan/ftgn-journalism/content/essays/30-14-Fallujah-2004.org
sed -i "" 's/#+LOCATION: Haditha/#+LOCATION: Iraq/' /Users/zeeshankhan/ftgn-journalism/content/essays/31-16-Haditha-2005.org

# Somalia
sed -i "" 's/#+LOCATION: Mogadishu/#+LOCATION: Somalia/' /Users/zeeshankhan/ftgn-journalism/content/essays/32-33-Mogadishu-2007.org

# Afghanistan (continued)
sed -i "" 's/#+LOCATION: Bala Balok/#+LOCATION: Afghanistan/' /Users/zeeshankhan/ftgn-journalism/content/essays/33-07-Bala-Balok-2009.org
sed -i "" 's/#+LOCATION: Marjah/#+LOCATION: Afghanistan/' /Users/zeeshankhan/ftgn-journalism/content/essays/34-31-Marjah-2010.org
sed -i "" 's/#+LOCATION: Kunar/#+LOCATION: Afghanistan/' /Users/zeeshankhan/ftgn-journalism/content/essays/35-28-Kunar-2011.org

# Yemen
sed -i "" 's/#+LOCATION: Khashamir/#+LOCATION: Yemen/' /Users/zeeshankhan/ftgn-journalism/content/essays/36-25-Khashamir-2012.org 2>/dev/null || true
sed -i "" 's/#+LOCATION: Hodeidah/#+LOCATION: Yemen/' /Users/zeeshankhan/ftgn-journalism/content/essays/50-20-Hodeidah-2025.org
sed -i "" 's/#+LOCATION: Saada/#+LOCATION: Yemen/' /Users/zeeshankhan/ftgn-journalism/content/essays/51-43-Saada-2025.org
sed -i "" 's/#+LOCATION: Sanaa/#+LOCATION: Yemen/' /Users/zeeshankhan/ftgn-journalism/content/essays/52-45-Sanaa-2025.org

# Pakistan
sed -i "" 's/#+LOCATION: North Waziristan/#+LOCATION: Pakistan/' /Users/zeeshankhan/ftgn-journalism/content/essays/37-37-North-Waziristan-2013.org

# Iraq/Syria (ISIS war)
sed -i "" 's/#+LOCATION: Tikrit/#+LOCATION: Iraq/' /Users/zeeshankhan/ftgn-journalism/content/essays/39-48-Tikrit-2015.org
sed -i "" 's/#+LOCATION: Manbij/#+LOCATION: Syria/' /Users/zeeshankhan/ftgn-journalism/content/essays/40-30-Manbij-2016.org
sed -i "" 's/#+LOCATION: Sirte/#+LOCATION: Libya/' /Users/zeeshankhan/ftgn-journalism/content/essays/41-46-Sirte-2016.org
sed -i "" 's/#+LOCATION: Al Qaim/#+LOCATION: Iraq/' /Users/zeeshankhan/ftgn-journalism/content/essays/42-02-Al-Qaim-2017.org
sed -i "" 's/#+LOCATION: Deir Ez Zor/#+LOCATION: Syria/' /Users/zeeshankhan/ftgn-journalism/content/essays/43-11-Deir-ez-Zor-2017.org
sed -i "" 's/#+LOCATION: Mosul/#+LOCATION: Iraq/' /Users/zeeshankhan/ftgn-journalism/content/essays/44-34-Mosul-2017.org
sed -i "" 's/#+LOCATION: Raqqa/#+LOCATION: Syria/' /Users/zeeshankhan/ftgn-journalism/content/essays/45-41-Raqqa-2017.org
sed -i "" 's/#+LOCATION: Tabqa/#+LOCATION: Syria/' /Users/zeeshankhan/ftgn-journalism/content/essays/46-47-Tabqa-2017.org
sed -i "" 's/#+LOCATION: Baghouz/#+LOCATION: Syria/' /Users/zeeshankhan/ftgn-journalism/content/essays/47-06-Baghouz-2019.org

# Yemen (continued)
sed -i "" 's/#+LOCATION: Al Bayda/#+LOCATION: Yemen/' /Users/zeeshankhan/ftgn-journalism/content/essays/48-01-Al-Bayda-2020.org
sed -i "" 's/#+LOCATION: Al Shabab Camp/#+LOCATION: Somalia/' /Users/zeeshankhan/ftgn-journalism/content/essays/49-03-Al-Shabab-Camp-2022.org

# Also fix tags
echo "Fixing tags..."
find /Users/zeeshankhan/ftgn-journalism/content/essays -name "*.org" -exec sed -i "" 's/#+HUGO_TAGS: civilian/#+HUGO_TAGS: Civilians/g' {} \;

echo "Finished updating locations to countries and fixing tags."
echo "Please rebuild the site to see the changes."