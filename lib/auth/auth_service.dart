import 'package:stylus/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient  _supabase = Supabase.instance.client;

  // Sign in with email
Future<AuthResponse> signInWithEmailPassword(String email, String password) async {
  return supabase.auth.signInWithPassword(email: email, password: password);
}

 // sign up with email

 Future<AuthResponse> signUpWithEmailPassword(String email, String password) async {
  final authResponse = await supabase.auth.signUp(email: email, password: password);

    // If sign-up was successful and we have a user
  if (authResponse.user != null) {
    // Get the user ID from the auth response
    final userId = authResponse.user!.id;
    
    // Prepare profile data
    final profileData = {
      // Don't need to include id if you have a trigger to create the profile,
      // but you can explicitly set it if needed
      'id': userId,
      
      // Add any additional profile fields
      'username': 'HKB',
      // if (subscriptionType != null) 'subscription_type': subscriptionType,
    };
    
    // If you have an automatic trigger that creates profile entries,
    // you'll want to update the existing record instead of inserting
    await supabase.from('profiles').upsert(profileData);
  }
  
  return authResponse;
}

// Sign Out

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

// get user email
  String? getCurrentEmail() {
    final session = _supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }

// getting profile info

Future <String?> getCurrentUsername() async {

  final userId = supabase.auth.currentUser?.id;
  if (userId == null) return null;
    
    try {
      // Query the profiles table for the current user's profile
      final response = await supabase
        .from('profiles')
        .select('username')
        .eq('id', userId)
        .single(); // Use single() since we expect only one row
      
      // Return the username
      print(response['username']);
      return response['username'] as String?;
    } catch (e) {
      print('Error fetching username: $e');
      return null;
    }
}


// get id
Future <String?> getCurrentId() async {
  final userId = supabase.auth.currentUser?.id;
  if (userId == null) return null;
}




}