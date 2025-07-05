import 'package:flutter/material.dart';
import 'actuals.dart';
import 'constants.dart';
import 'widgets.dart';

final List<Map<String, String>> executives = [
  {
    'name': '${exf[0]} ${exl[0]}',
    'role': 'CEO – ${exn[0]} leads the entire café operation with a focus on strategy, growth, and big-picture direction. He makes key decisions about expansion, partnerships, and brand identity while ensuring the café stays ahead of trends in tech and lifestyle.',
  },
  {
    'name': '${exf[1]} ${exl[1]}',
    'role': 'CCO – ${exn[1]} shapes the café\'s identity and how it\'s seen by the world. He leads marketing, promotions, design, and communication. From posters and events to social media and ad campaigns, he is the storyteller who brings customers through the door.',
  },
  {
    'name': '${exf[2]} ${exl[2]}',
    'role': 'COO – ${exn[2]} oversees the day-to-day customer experience—everything from the quality of food and beverages to staff service and cleanliness. He ensures operations run smoothly, guests are happy, and service standards are met or exceeded.',
  },
  {
    'name': '${exf[3]} ${exl[3]}',
    'role': 'CFO – ${exn[3]} handles budgeting, pricing strategy, payroll, and financial planning. He keeps the business profitable while balancing investments in equipment, food supply, and marketing.',
  },
  {
    'name': '${exf[4]} ${exl[4]}',
    'role': 'CTO – ${exn[4]} manages all things tech: high-speed internet, gaming rigs, software, cybersecurity, and digital systems. He ensures the café stays cutting-edge and the tech just works—whether it\'s cloud gaming or coffee-ordering tablets.',
  },
];

final List<Map<String, String>> timeline = [
  {
    'year': '1993',
    'event': 'RadoBros Bakery founded in Pittsburgh, PA by ${ff[0]} and ${ff[1]} $fl. Earnings helped support their sick father, Vladimir.'
  },
  {
    'year': '1993 (June)',
    'event': 'Vladimir passed away. ${ff[2]} ${fs[2]}, ${ff[0]}\'s fiancée, helped support the family.'
  },
  {
    'year': '1997',
    'event': '${ff[0]} and ${ff[2]} moved to Biringan, Philippines. D-Net internet café was established.'
  },
  {
    'year': '2017',
    'event': 'Five young entrepreneurs named ${exn[0]} ${exl[0]}, ${exn[1]} ${exl[1]}, ${exn[2]} ${exl[2]}, ${exn[3]} ${exl[3]}, and ${exn[4]} ${exl[4]} joined the business and rebranded it as BDGiT NEaT Cafe Services. The eatery was revived with new snack offerings.'
  },
  {
    'year': '2020–2022',
    'event': 'During the COVID-19 pandemic, BDGiT NEaT adapted with PC rentals, virtual coworking, and online food delivery.'
  },
  {
    'year': '2023-2024',
    'event': 'Launched BDGiT EDU Connect, partnering with schools to provide affordable digital access.'
  },
  {
    'year': '2025',
    'event': '${owf[0]} $fl, ${ff[0]}’s son, steps down as the sole owner to pursue his personal endeavors. He transfers ownership to his cousin, ${owf[1]} \'${own[1]}\' $fl, ${ff[1]}\'s son. BDGiT NEaT is now the undisputed leading internet cafe in Biringan.'
  },
];

final List<Widget> march1119 = [
  Text('Since 2017, BDGiT has been operating in Biringan. It is an internet cafe with different gaming consoles. It also serves snacks such as taco, nachos, and beverages such as juice, iced tea, but not soft drinks.', textAlign: TextAlign.justify), sbh8,
  Text('Since 2017, BDGiT has been operating in Biringan. It is an internet cafe with different gaming consoles. It also serves snacks such as taco, nachos, and beverages such as juice, iced tea, but not soft drinks.', textAlign: TextAlign.justify), sbh8,
  Text('In its 2 years of operation, it has constantly received positive remarks from gamers and known critics. It has received an A+ grade in terms of service. It also received a security badge for having no records of criminal offenses committed in the establishment.', textAlign: TextAlign.justify), sbh8,
  Text('Foreigners have expressed interest in the internet café. A number of them want a branch of BDGiT on their respective countries. Serbian Milos Petrović rated the shop 5 stars and requests for a franchise of it established in Belgrade. American Joshua Adams is amused about the tight security the shop has and hoped internet shops in Minnesota would implement those rules.', textAlign: TextAlign.justify),
];

final List<Widget> may1621 = [
  SlideshowWidget(images: floorPlan), sbh8,
  Text('Architect Jotaro Abe proposed a new floor plan for a new branch to be completed and opened in Ticbalang Drive, Biringan in 2023, with hopes that things will slowly go back to normal.', textAlign: TextAlign.justify), sbh8,
  Text('The first floor will feature a welcoming frontline/frontdesk, a gaming area integrated with a food counter, and a kitchen area tucked to the back for streamlined service. A staircase at the center will lead visitors up to the second floor.', textAlign: TextAlign.justify), sbh8,
  Text('The second floor will house the café’s PC area, a stockroom for equipment and supplies, and a VIP room—a quieter, more exclusive space for top-tier guests or private sessions.', textAlign: TextAlign.justify), sbh8,
  Text('Though the internet café industry has been impacted heavily by the pandemic, the planned 2023 launch aligns with growing hopes that life—and businesses—will return to normal.', textAlign: TextAlign.justify), sbh8,
  Text('“People need spaces to reconnect,” Abe stated. “This café is designed not just for gaming, but for community.”', textAlign: TextAlign.justify),
];