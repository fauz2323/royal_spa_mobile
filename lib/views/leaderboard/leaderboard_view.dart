import 'dart:math';
import 'package:flutter/material.dart';

class LeaderboardView extends StatefulWidget {
  const LeaderboardView({super.key});

  @override
  State<LeaderboardView> createState() => _LeaderboardViewState();
}

class _LeaderboardViewState extends State<LeaderboardView> {
  List<LeaderboardUser> leaderboardData = [];

  @override
  void initState() {
    super.initState();
    _generateRandomLeaderboard();
  }

  void _generateRandomLeaderboard() {
    final random = Random();
    final usernames = [
      'AlexWarrior',
      'SarahQueen',
      'MikeChamp',
      'EmilyStars',
      'DavidKing',
      'LisaDream',
      'JohnLegend',
      'AnnaRose',
      'TomHero',
      'JennyWin',
      'ChrisPro',
      'SophiaGem',
      'RyanMaster',
      'OliviaAce',
      'EthanElite'
    ];

    // Shuffle usernames
    usernames.shuffle();

    // Generate random points (sorted descending)
    List<int> points =
        List.generate(10, (index) => random.nextInt(9000) + 1000);
    points.sort((a, b) => b.compareTo(a));

    leaderboardData = List.generate(
      10,
      (index) => LeaderboardUser(
        rank: index + 1,
        username: usernames[index],
        points: points[index],
      ),
    );
  }

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return const Color(0xFFFFD700); // Gold
      case 2:
        return const Color(0xFFC0C0C0); // Silver
      case 3:
        return const Color(0xFFCD7F32); // Bronze
      default:
        return Colors.grey.shade400;
    }
  }

  IconData _getRankIcon(int rank) {
    switch (rank) {
      case 1:
        return Icons.emoji_events;
      case 2:
        return Icons.emoji_events;
      case 3:
        return Icons.emoji_events;
      default:
        return Icons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Leaderboard',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            _generateRandomLeaderboard();
          });
        },
        child: Column(
          children: [
            // Header Card with Trophy
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green.shade400,
                    Colors.green.shade700,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.shade200.withOpacity(0.5),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.emoji_events,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Top Players',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'This Month\'s Champions',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Top 3 Podium
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (leaderboardData.length >= 2)
                    _buildPodiumCard(leaderboardData[1], 2, 140),
                  if (leaderboardData.isNotEmpty)
                    _buildPodiumCard(leaderboardData[0], 1, 160),
                  if (leaderboardData.length >= 3)
                    _buildPodiumCard(leaderboardData[2], 3, 120),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Leaderboard List
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 20, bottom: 16),
                  itemCount: leaderboardData.length,
                  itemBuilder: (context, index) {
                    return _buildLeaderboardItem(leaderboardData[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPodiumCard(LeaderboardUser user, int rank, double height) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _getRankColor(rank),
            boxShadow: [
              BoxShadow(
                color: _getRankColor(rank).withOpacity(0.4),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Icon(
              _getRankIcon(rank),
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          user.username,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: _getRankColor(rank).withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '${user.points} pts',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: _getRankColor(rank).withOpacity(0.8),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 90,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _getRankColor(rank).withOpacity(0.8),
                _getRankColor(rank),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: _getRankColor(rank).withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              '#$rank',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderboardItem(LeaderboardUser user) {
    final isTopThree = user.rank <= 3;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isTopThree
            ? _getRankColor(user.rank).withOpacity(0.05)
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isTopThree
              ? _getRankColor(user.rank).withOpacity(0.3)
              : Colors.grey.shade200,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: isTopThree
                  ? [
                      _getRankColor(user.rank).withOpacity(0.7),
                      _getRankColor(user.rank),
                    ]
                  : [
                      Colors.grey.shade300,
                      Colors.grey.shade400,
                    ],
            ),
            boxShadow: [
              BoxShadow(
                color: isTopThree
                    ? _getRankColor(user.rank).withOpacity(0.3)
                    : Colors.grey.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: isTopThree
                ? Icon(
                    _getRankIcon(user.rank),
                    color: Colors.white,
                    size: 24,
                  )
                : Text(
                    '#${user.rank}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
        title: Text(
          user.username,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isTopThree ? FontWeight.bold : FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          'Rank #${user.rank}',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isTopThree
                  ? [
                      _getRankColor(user.rank).withOpacity(0.7),
                      _getRankColor(user.rank),
                    ]
                  : [
                      Colors.green.shade400,
                      Colors.green.shade600,
                    ],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: isTopThree
                    ? _getRankColor(user.rank).withOpacity(0.3)
                    : Colors.green.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            '${user.points} pts',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class LeaderboardUser {
  final int rank;
  final String username;
  final int points;

  LeaderboardUser({
    required this.rank,
    required this.username,
    required this.points,
  });
}
