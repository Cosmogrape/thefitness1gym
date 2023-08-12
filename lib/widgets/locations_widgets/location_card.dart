import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:phone_number/phone_number.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';
import 'package:thefitness1gym/values/predefined_radius.dart';
import 'package:thefitness1gym/global/color_extension.dart';
import 'package:thefitness1gym/global/map_coordinates.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    required this.title,
    required this.description,
    required this.location,
    this.isOpen = false,
    required this.coordinates,
    required this.phone,
    this.image,
    super.key,
  });

  final String title;
  final String description;
  final String location;
  final bool isOpen;
  final MapCoordinates coordinates;
  final PhoneNumber phone;
  final Uri? image;

  Uri get _tel => Uri.parse("tel:${phone.international}");

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const borderRadius = BorderRadius.all(Radius.circular(PredefinedRadius.medium));

    return Card(
      shape: const RoundedRectangleBorder(borderRadius: borderRadius),
      color: theme.colorScheme.surface,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: borderRadius,
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.background.withOpacity(0.5),
                      blurRadius: 50,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: borderRadius,
                  child: Image.network(
                    image.toString(),
                    fit: BoxFit.cover,
                    loadingBuilder: (context, widget, imageChunkEvent) {
                      if (imageChunkEvent != null) return widget;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset("assets/images/fitness1_cover.jpg");
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(PredefinedPadding.regular),
                child: BlurryContainer(
                  borderRadius: borderRadius,
                  blur: 2,
                  padding: const EdgeInsets.symmetric(horizontal: PredefinedPadding.medium, vertical: PredefinedPadding.small),
                  color: (isOpen ? theme.colorScheme.primary : theme.colorScheme.error).withOpacity(.68).withSaturation(.5).withBrightness(.15),
                  child: Text(
                    isOpen ? "OPEN" : "CLOSED",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: (isOpen ? theme.colorScheme.primary : theme.colorScheme.error).withBrightness(.8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: PredefinedPadding.medium, vertical: PredefinedPadding.regular),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    // text: title,
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                    children: [
                      TextSpan(text: title),
                      TextSpan(
                        text: " — $location",
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: PredefinedPadding.medium),
                Text(description),
                const SizedBox(height: PredefinedPadding.medium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () async {
                        if (await canLaunchUrl(_tel)) await launchUrl(_tel);
                      },
                      icon: const Icon(FontAwesomeIcons.phone),
                      label: const Text("Contact"),
                    ),
                    TextButton.icon(
                      onPressed: () => MapsLauncher.launchCoordinates(coordinates.latitude, coordinates.longitude),
                      icon: const Icon(FontAwesomeIcons.mapLocation),
                      label: const Text("View on map"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
