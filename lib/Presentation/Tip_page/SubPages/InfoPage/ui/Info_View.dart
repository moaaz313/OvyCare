import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/themes/Colors/ColorsStyle.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge;
    final selectedTextStyle = textStyle?.copyWith(fontWeight: FontWeight.bold);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar:  AppBar(
            backgroundColor: ColorStyle.pink,
            title:const Text("PCOD Test",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            centerTitle: true,
            leading: IconButton(onPressed: (){
              Navigator.of(context).pop();
            }, icon:const Icon(Icons.arrow_back_ios,color: Colors.white,) ),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SegmentedTabControl(
                    // Customization of widget
                    tabTextColor: Colors.black,
                    selectedTabTextColor: Colors.white,
                    indicatorPadding: const EdgeInsets.all(4),
                    squeezeIntensity: 2,
                    tabPadding: const EdgeInsets.symmetric(horizontal: 8),
                    textStyle: textStyle,
                    selectedTextStyle: selectedTextStyle,
                    // Options for selection
                    // All specified values will override the [SegmentedTabControl] setting
                    tabs: [
                      SegmentTab(
                        label: 'About',
                        // For example, this overrides [indicatorColor] from [SegmentedTabControl]
                        color: Colors.pink.shade300,
                        backgroundColor: Colors.red.shade100,
                      ),
                      SegmentTab(
                        label: 'Causes',
                        backgroundColor: Colors.blue.shade100,
                        color: Colors.blue.shade300
                      ),
                      SegmentTab(
                        label: 'Treatment',
                        backgroundColor: Colors.orange.shade100,
                        color: Colors.orange.shade300,
                      ),
                    ],
                  ),
                ),
                // Sample pages
                Padding(
                  padding:  EdgeInsets.only(left: 16.w, right: 16.w,top: 70.h),
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SampleWidget(
                        label: 'FIRST PAGE',
                        color: Colors.transparent,
                        widget:
                        Expanded(
                          child: ListView.builder(
                            itemCount: pcosFaq.length,
                            physics: const AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.only(top: 5.h),
                                child: ExpandablePanel(
                                  header: Text(
                                    pcosFaq[index]['question']!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: ColorStyle.black,
                                    ),
                                  ),
                                  collapsed: const Divider(),
                                  expanded: Text(
                                    pcosFaq[index]['answer']!,
                                    softWrap: true,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                      ),
                      SampleWidget(
                        label: 'SECOND PAGE',
                        color: Colors.blue.shade100, widget:
                      ExpandablePanel(
                        header:Text(pcosFaq[1]['question']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        collapsed:  const Text(
                          'Include: ',
                          style: TextStyle(
                            fontSize: 16,
                          ),softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                        expanded: Text(pcosFaq[1]['answer'], softWrap: true, ),
                        // tapHeaderToExpand: true,
                        // hasIcon: true,
                      ),
                      ),
                      SampleWidget(
                        label: 'THIRD PAGE',
                        color: Colors.orange.shade100,
                        widget:
                        ExpandablePanel(
            header:Text(pcosFaq[1]['question']!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            collapsed:  const Text(
              'Include: ',
              style: TextStyle(
                fontSize: 16,
              ),softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
            expanded: Text(pcosFaq[1]['answer'], softWrap: true, ),
            // tapHeaderToExpand: true,
            // hasIcon: true,
          ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

List pcosFaq = [
  {
    "question": "How many people have PCOS?",
    "answer":
    "Answered by Dr. Allison Rodgers\n\n"
        "If you think you might have PCOS, you're not alone. It's one of the most common conditions in women 15 to 49 years old, affecting 4% to 20%.\n"
        "Wait, 4% to 20%- quite a broad range, right? This is because reported rates around the world differ. In Australia, Turkey, and Denmark, there are higher rates of around 15% to 20%, while in Palestine, Brazil, Sri Lanka, the UK, Greece, and Spain, it's more like 5% to 10%. And in Southern China, Iran, and the US, it's just 2% to 4%. This is likely due to differences in how it's diagnosed and access to medical care and education.\n"
        "There may also be differences in how different ethnicities experience PCOS. For example, Hispanic women with PCOS are more likely to have higher levels of androgens ('male' sex hormones), so it might be easier to pick up in tests.\n"
        "Incredibly, up to 75% of affected women around the world remain undiagnosed."
  },
  {
    "question": "Is PCOS making me hairier?",
    "answer":
    "Answered by Dr. Allison Rodgers\n\n"
        "One symptom of PCOS is elevated levels of androgens ('male' sex hormones). This can cause thicker, darker hair growth than would be typical otherwise - particularly in areas like the face, neck, chest, tummy, back, butt, or thighs. This is also known as hirsutism.\n"
        "While hirsutism can be a symptom of a health issue and should be checked with your doctor, it's normal for women to have facial and body hair, and there's nothing 'wrong' with having extra hair. In many cases, it's linked to your genetics. So whether you want to 'treat it' is a matter of personal choice.\n"
        "However, a survey of women with PCOS found that 90% felt their facial hair was a problem. If hair growth bothers you, it's worth speaking to your doctor about treatments. These could include electrolysis, laser hair removal, waxing, shaving, and hair removal cream — experiment to find what works for you."
  },
  {
    "question": "Can I still get pregnant with PCOS?",
    "answer":
    "Answered by Dr. Allison Rodgers\n\n"
        "For around 25% of women who struggle to conceive, the problem is not ovulating regularly. More than 80% of the time, this is due to PCOS.\n"
        "If you aren't having regular periods, you probably aren't ovulating regularly either. However, this isn't a cause to panic, as your doctor can help you and the stats are on your side. An Australian study that tracked over 9,000 women over thirteen years found that those with PCOS had a similar number of pregnancies to those without. A 2009 Swedish study found the same: 91.6% of those without PCOS gave birth to at least one child versus 86.7% of women with PCOS.\n"
        "There are also many treatments that can help. Your doctor might guide you toward a PCOS-friendly diet, medication, or even in vitro fertilization (IVF). It all depends on your personal circumstances and preferences (and we're here to support you along the way!)."
  },
  {
    "question": "What else could be causing my symptoms?",
    "answer":
    "Answered by Dr. Amanda Kallen\n\n"
        "Several conditions share symptoms with PCOS, including thyroid problems, hormonal imbalances, ovarian cysts, and certain adrenal gland disorders. Symptoms like acne, bloating, or occasional mood changes might also be influenced by external factors or just be unique to your body. It's important to collaborate closely with your health care provider to investigate these potential causes thoroughly."
  },
  {
    "question": "Who should I talk to about my symptoms?",
    "answer":
    "Answered by Dr. Amanda Kallen\n\n"
        "It's important to discuss your symptoms with a health care provider who can work with you to explore their cause. Depending on where you live, you might start with your health care provider, who can refer you to a specialist if necessary, or skip straight to seeing a gynecologist. These health care professionals can assess your symptoms and recommend further evaluation if needed."
  },
  {
    "question": "Should I be worried if I'm diagnosed with PCOS by my doctor?",
    "answer":
    "Answered by Dr. Amanda Kallen\n\n"
        "PCOS might sound worrying, but many people live normal lives with this condition. There is no 'cure' per se, but treatments are available to minimize symptoms such as hair growth and acne, improve chances of pregnancy, and reduce pregnancy complications. Most women with PCOS will be able to conceive, though, in some cases, it may require fertility treatment. Lifestyle changes, like exercise and diet, can significantly improve symptoms. Knowing you have PCOS is an important first step in reducing the risk of long-term health issues that are more common in PCOS, such as diabetes."
  },
  {
    "question": "How can I prepare for my appointment?",
    "answer":
    "Answered by Dr. Amanda Kallen\n\n"
        "The thought of talking to a health care provider may seem daunting, but making sure you are prepared can help give you peace of mind. Keep logging your symptoms in the Flo app and retake the self-assessment right before your appointment to make sure your answers are up to date. Even if updating your answers means your result changes, it's still worth discussing with your health care provider. Make a note of important things you want to share with your doctor, such as your current medications. Consider who you might want to bring with you for support, and make a list of questions you want to ask. Remember, your concerns should be listened to. If you don't feel like you're being heard, it's OK to seek another opinion."
  },
  {
    "question": "What should I expect when visiting my health care provider?",
    "answer":
    "Answered by Dr. Amanda Kallen\n\n"
        "At your appointment, you can expect your health care provider to ask about your symptoms in detail. This is where our checklist can come in handy. They may also perform a physical examination, order blood tests or imaging scans to understand your symptoms, try to find a cause, and put together a personalized treatment plan for you."
  }
];

class SampleWidget extends StatelessWidget {
  const SampleWidget({
    Key? key,
    required this.label,
    required this.color,
    required this.widget,
  }) : super(key: key);

  final String label;
  final Color color;
  final Widget widget;


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Column(
        children: [
          widget
        ],
      ),
    );
  }
}