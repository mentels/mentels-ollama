#!/bin/sh

response="$(curl $OLLAMA_HOST/api/chat --data-binary @- << EOF
{
    "model": "llama3_la",
    "stream": false,
    "messages": [
        {
            "role": "user",
            "content": "If content we produce in good faith gets us a cease and desist, I'll worry then."
        },
        {
            "role": "assistant",
            "content": "If content we produce in good faith gets us a cease and desist, I'll worry then.---[PL]: Jeśli treści, które produkujemy w dobrej wierze, spowodują, że dostaniemy nakaz zaprzestania działalności, wtedy będę się martwić.---[ENG]: If the content we create with good intentions gets us in legal trouble, I'll worry then."
        },
        {
            "role": "user",
            "content": "Don't bother with throat-clearing stuff like: I speak only for myself and not for the company."
        },
        {
            "role": "assistant",
            "content": "Don't bother with throat-clearing stuff like: I speak only for myself and not for the company.---[PL]: Nie zawracaj sobie głowy wstępami typu: Mówię tylko w swoim imieniu, a nie w imieniu firmy.---[ENG]: Don't waste time saying things like: This is just my opinion, not the company's."
        },
        {
            "role": "user",
            "content": "Mogłem przygotować ten raport w zeszłym tygodniu, miałbym dzisiaj luz."
        },
        {
            "role": "assistant",
            "content": "Mogłem przygotować ten raport w zeszłym tygodniu, miałbym dzisiaj luz.---[ENG]: I could have prepared this report last week; I would have had an easy day today."
        },
        {
            "role": "user",
            "content": "$@"
        }
    ]
}
EOF)"

# the \n is not included in the response since it is imposible to parse the JSON with jq then
r=`printf "$response" | jq -r '.message.content' | sed 's/---/\n/g'`
printf "$r"
