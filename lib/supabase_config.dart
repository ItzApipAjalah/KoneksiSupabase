import 'package:supabase_flutter/supabase_flutter.dart';

const String supabaseUrl = 'https://xegdlvcjwxcphybvakfj.supabase.co';
const String supabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhlZ2RsdmNqd3hjcGh5YnZha2ZqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTgyMDY2MjYsImV4cCI6MjAzMzc4MjYyNn0.vK59SDGAS_f-HZfmoDdrr1wh8QDFdwrtLpbHUnrjklE';

Future<void> initSupabase() async {
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
}
