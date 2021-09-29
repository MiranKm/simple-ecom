import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iqapp/pages/product_details_page.dart';
import 'package:iqapp/providers/main_provider.dart';
import 'package:iqapp/providers/theme_provider.dart';
import 'package:iqapp/util/constants.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<MainProvider>().getAllData();

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("IQ Shop"),
        actions: [
          IconButton(
            icon: Icon(Icons.format_paint),
            onPressed: () {
              final ThemeProvider provider = context.read<ThemeProvider>();
              if (provider.theme == ThemeMode.light)
                provider.theme = ThemeMode.dark;
              else
                provider.theme = ThemeMode.light;
            },
          ),
        ],
      ),
      body: Consumer<MainProvider>(
        builder: (context, value, child) {
          return value.modelHolder.res(
            completed: (data) {
              return ListView(
                children: [
                  SizedBox(
                    height: 200,
                    child: CarouselSlider(
                      items: value
                          .getSection(0, "slider")
                          .items
                          .map(
                            (e) => Card(
                          elevation: 4,
                          margin: EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            height: 160,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: CachedNetworkImage(
                                imageUrl: e?.image ?? "",
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, _) =>
                                    Icon(Icons.image, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      )
                          .toList(),
                      options: CarouselOptions(
                          autoPlay: true,
                          autoPlayAnimationDuration: Duration(seconds: 2),
                          viewportFraction: 0.86,
                          autoPlayCurve: Curves.bounceOut,
                          reverse: true,
                          aspectRatio: 16 / 9,
                          scrollDirection: Axis.vertical,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Categories",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 52,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.getSection(0, "categories").items.length,
                      itemBuilder: (context, index) {
                        var item =
                        value.getSection(0, "categories").items[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              item?.title ?? "",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  divider,
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Best Of The Best",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    runSpacing: 20.0,
                    spacing: 16.0,
                    alignment: WrapAlignment.center,
                    children: value
                        .getSection(0, "bestOfTheBest")
                        .items
                        .map(
                          (e) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetailsPage(e),
                          ));
                        },
                        child: SizedBox(
                          width: (size.width / 2) - 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 160,
                                child: Stack(
                                  children: [
                                    Hero(
                                      tag: "${e.title + e.price}",
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(4),
                                        child: CachedNetworkImage(
                                          imageUrl: e.image,
                                          fit: BoxFit.cover,
                                          height: 160,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 8,
                                      bottom: 8,
                                      child: Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          boxShadow: [],
                                          borderRadius:
                                          BorderRadius.circular(4),
                                          color: Colors.teal,
                                        ),
                                        child: Text(
                                          "${e.price} ${e?.currency ?? ""}",
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(e.title),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    )
                        .toList(),
                  ),

                  //  stores
                  divider,
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Stores",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 160,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.getSection(0, "stores").items.length,
                        itemBuilder: (context, index) {
                          var item = value.getSection(0, "stores").items[index];
                          return Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 6.0),
                            child: SizedBox(
                              height: 120,
                              width: size.width * 0.3,
                              child: Stack(
                                children: [
                                  Hero(
                                    tag: "${item.title}",
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: CachedNetworkImage(
                                        imageUrl: item.image,
                                        fit: BoxFit.cover,
                                        height: 160,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                              Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.6),
                                              Colors.white10,
                                            ])),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                          width: size.width * 0.24,
                                          child: Text(
                                            item.title,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              );
            },
            error: (error) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(error ?? ""),
                    TextButton.icon(
                        onPressed: () {
                          context.read<MainProvider>().getAllData();
                        },
                        icon: Icon(Icons.refresh),
                        label: Text("Refresh"))
                  ],
                )),
          );
        },
      ),
    );
  }
}
