import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iqapp/models/product.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage(this.product);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool isProfileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Hero(
            tag: "${widget.product.title + widget.product.price}",
            child: Stack(
              children: [
                ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl: widget.product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                /*Positioned(
                  right: 16,
                  bottom: 16,
                  child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.teal,
                      ),
                      child: Text("${product.price} ${product?.currency ?? ""}")),
                ),*/
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.teal,
                    ),
                    child: Text(
                      "${widget.product.price} ${widget.product?.currency ?? ""}",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.product?.subtitle ?? "",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Divider(),
          AnimatedCrossFade(
            crossFadeState: isProfileExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: Duration(milliseconds: 200),
            firstChild: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  width: 50,
                  height: 50,
                  imageUrl: widget.product.storeInfo.cover,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                widget.product.storeInfo.name,
              ),
              subtitle: Text(
                widget.product.storeInfo.phoneNumber,
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {
                setState(() {
                  isProfileExpanded = !isProfileExpanded;
                });
              },
            ),
            secondChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      width: 50,
                      height: 50,
                      imageUrl: widget.product.storeInfo.cover,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    widget.product.storeInfo.name,
                  ),
                  subtitle: Text(
                    widget.product.storeInfo.phoneNumber,
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () {
                    setState(() {
                      isProfileExpanded = !isProfileExpanded;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        "Address: ${widget.product.storeInfo.contact.address}",
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Location: ${widget.product.storeInfo.contact.location}",
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Open day: ${widget.product.storeInfo.contact.openDay}",
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Closing day: ${widget.product.storeInfo.contact.closeDay}",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
