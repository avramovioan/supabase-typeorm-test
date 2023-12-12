// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "https://deno.land/std@0.168.0/http/server.ts";

serve(async (req) => {
  const { type } = (await req.json()) as {
    type: "INSERT" | "UPDATE";
    table: "bookings";
    schema: "public";
    record: null;
    old_record: null;
  };

  if (type === "INSERT") {
    console.log("new booking created, will send notification");
  } else {
    console.log("booking updated, will send notification");
  }

  return new Response(JSON.stringify({ done: true }), {
    headers: { "Content-Type": "application/json" },
  });
});
