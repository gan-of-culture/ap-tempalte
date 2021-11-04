def fill_streaming_sites()
    to_convert = Hash.new

    to_convert["Site"] = ask("Is Site Eng or Non-Eng?")
    to_convert["Site Name"] = ask("Site Name:")
    to_convert["Web Address"] = ask("Web Address:")
    to_convert["Ads"] = ask_yes_or_no("Has Ads?")
    to_convert["Anti Adblock"] = ask_yes_or_no("Has Anti-Adblock?")
    to_convert["English Dub"] = ask_yes_or_no("Has English Dub?")
    to_convert["English Sub"] = ask_yes_or_no("Has English Sub?")
    to_convert["Other Languages"] = ask("Has Other Languages?")
    to_convert["Video Quality"] = ask("Video Qualities: (1080p, 720p, etc.)")
    to_convert["Schedule"] = ask_yes_or_no("Has Schedule?")
    to_convert["Supports Downloading"] = ask_yes_or_no("Supports Downloading?")
    to_convert["Supports Batch Downloading"] = ask_yes_or_no("Supports Batch Downloading?")
    to_convert["Mobile Friendly"] = ask_yes_or_no("Is Mobile Friendly?")
    to_convert["MAL-Sync Extension Support"] = ask_yes_or_no("Has MAL-Sync Extension Support?")
    to_convert["Watermark"] = ask_yes_or_no("Has Watermarks?")
    to_convert["Disqus"] = ask_yes_or_no("Has a Discussion Section?")

    to_convert
end
def fill_manga_sites()
    to_convert = Hash.new

    to_convert["Site"] = ask("Is Site Eng or Non-Eng?")
    to_convert["Site Name"] = ask("Site Name:")
    to_convert["Web Address"] = ask("Web Address:")
    to_convert["Ads"] = ask_yes_or_no("Has Ads?")
    to_convert["Anti Adblock"] = ask_yes_or_no("Has Anti-Adblock?")
    to_convert["Other Languages"] = ask("Has Other Languages?")
    to_convert["Mobile Friendly"] = ask_yes_or_no("Is Mobile Friendly?")
    to_convert["MAL-Sync Extension Support"] = ask_yes_or_no("Has MAL-Sync Extension Support?")
    to_convert["Tachiyomi Support"] = ask_yes_or_no("Has Tachiyomi Support?")
    to_convert["Other Features"] = ask("Has other Features?")

    to_convert
end
def fill_novel_sites()
    to_convert = Hash.new

    to_convert["Site"] = ask("Is Site Eng or Non-Eng?")
    to_convert["Site Name"] = ask("Site Name:")
    to_convert["Web Address"] = ask("Web Address:")
    to_convert["Ads"] = ask_yes_or_no("Has Ads?")
    to_convert["Anti Adblock"] = ask_yes_or_no("Has Anti-Adblock?")
    to_convert["Other Languages"] = ask("Has Other Languages?")
    to_convert["MTL"] = ask_yes_or_no("Is machine translated?")
    to_convert["Supports Downloading"] = ask_yes_or_no("Supports Downloading?")
    to_convert["Mobile Friendly"] = ask_yes_or_no("Is Mobile Friendly?")
    to_convert["Other Features"] = ask("Has other Features?")

    to_convert
end
def fill_applications()
    to_convert = Hash.new

    to_convert["Site"] = ask("Is Site Eng or Non-Eng?")
    to_convert["Site Name"] = ask("Site Name:")
    to_convert["Web Address"] = ask("Web Address:")
    to_convert["MAL-Sync Extension Support"] = ask_yes_or_no("Has MAL-Sync Extension Support?")
    to_convert["Anilist-Sync Extension Support"] = ask_yes_or_no("Has Anilist-Sync Extension Support?")
    to_convert["Kitsu-Sync Support"] = ask_yes_or_no("Has Kitsu-Sync Support?")
    to_convert["SimKL-Sync Support"] = ask_yes_or_no("Has SimKL-Sync Support?")
    to_convert["Tachiyomi Support"] = ask_yes_or_no("Has Tachiyomi Support?")
    to_convert["Other Features"] = ask("Has other Features?")

    to_convert
end

def ask(question)
    puts question
    gets.chomp
end

def ask_yes_or_no(question)
    puts question + " (y/n)"
    answer = gets.chomp.upcase
    if answer != "Y" and answer != "N"
        ask_yes_or_no(question)
    end
    case answer
    when "Y"
        answer = "Yes"
    when "N"
        answer = "No"
    end
    answer
end

puts "----------------------------------------------------------"
puts "Templating tool for adding websites to r/animepiracy index"
puts "----------------------------------------------------------"

site_types = ["Streaming Sites / Hentai Sites", "Manga Sites", "Novels", "Applications"]

puts "Please choose a template:"
site_types.each_with_index do |s,i|
    puts "#{i}. #{s}"
end

site_type = gets.chomp.to_i
if site_type > site_types.size - 1
    puts "Invaild number!"
    exit
end

puts "#{site_types[site_type]}"

to_convert = Hash.new
case site_type
when 0
    to_convert = fill_streaming_sites()
when 1
    to_convert = fill_manga_sites()
when 2
    to_convert = fill_novel_sites()
when 3
    to_convert = fill_applications()
end

to_convert.each_pair do |k, v|
    puts "**#{k}**: #{v}"
end

