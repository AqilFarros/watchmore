part of 'widget.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({super.key, required this.company});

  final ProductionCompany company;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          // CircleAvatar(
          //   backgroundImage: company.image != null
          //       ? NetworkImage(
          //           "https://image.tmdb.org/t/p/original/${company.image}")
          //       : NetworkImage(
          //           "https://ui-avatars.com/api/?background=random&name=${company.name}"),
          //   radius: 45,
          // ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              company.image != null
                  ? "https://image.tmdb.org/t/p/original/${company.image}"
                  : "https://ui-avatars.com/api/?background=random&name=${company.name}",
              height: 100,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            company.name!,
            style:
                description.copyWith(fontWeight: FontWeight.w600, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
