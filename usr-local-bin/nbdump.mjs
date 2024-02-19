#!/usr/bin/env zx

const length =
	await $`sqlite3 $HOME/.local/share/newsboat/cache.db ".mode json" "select title,pubDate,content from rss_item where unread = 1"`.pipe(
		$`jq ". | length"`
	);

for (let i = 0; i < length; i++) {
	const title =
		await $`sqlite3 $HOME/.local/share/newsboat/cache.db ".mode json" "select title,pubDate,content from rss_item where unread = 1" | jq -r ".[${i}] | .title"`;
	await $`sqlite3 $HOME/.local/share/newsboat/cache.db ".mode json" "select title,pubDate,content from rss_item where unread = 1" | jq -r ".[${i}] | .title,.pubDate,.content" > ${title}.html`;
}
