// --- ADD YOUR SUPABASE DETAILS HERE ---
// Your Project ID: vchogjjovugcgkcetvgz
// To find these values: Go to Settings > API in Supabase dashboard
const SUPABASE_URL = "https://vchogjjovugcgkcetvgz.supabase.co";
const SUPABASE_ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZjaG9nampvdnVnY2drY2V0dmd6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQwNzk2NjQsImV4cCI6MjA3OTY1NTY2NH0.wIvfBsrAcX39TAYDvwZDGHO5I-Gm51SVRU3bl4yORd0";

const supabase = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// Fetch next token number
async function getNextTokenNumber() {
    const { data, error } = await supabase
        .from("tokens")
        .select("token_no")
        .order("token_no", { ascending: false })
        .limit(1);

    if (error) console.error(error);

    return data.length ? data[0].token_no + 1 : 1;
}
