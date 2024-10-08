# A wrapper class for the OpenAI API client.
class Clients::OpenAi

  # Sends a prompt to the configured model and returns the relevant portion of the response.
  def self.request(prompt)
    client = OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: ENV.fetch("OPENAI_MODEL", "gpt-4o"),
        response_format: { type: "json_object" },
        messages: [{ role: "user", content: prompt }],
        temperature: 0.7,
      }
    )
    return JSON.parse(response.dig("choices", 0, "message", "content"))
  end

end
