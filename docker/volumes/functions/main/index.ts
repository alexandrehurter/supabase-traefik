// Main function entry point
Deno.serve(async (req) => {
  return new Response("Hello from Supabase Edge Functions!", {
    headers: { "Content-Type": "text/plain" },
  });
});
