# Language Assistant

## Notes

* the `MESSAGE` directive impacts only the interactive chat run with `ollama run llama3_la`
  * `ollama run llama3_la <prompt>` will not take that into account
  * instead, call the `/api/chat` directly and "translate" the message directives into the `messages` JSON in the API call
  * the workaround for `ollama run llama3_la <prompt>` is "copy" the `MESSAGE`s into the `SYSTEM`

## Models

* `llama3_la` - simple prompt with English "translation"
* `llama3_la_adv` - advanced prompt with `MESSAGE` / `request.sh`


---

Built with Meta Llama 3