{if $Enable_Tags && $pagename neq "cloud"}
{checkActionsTpl location="tpl_widget_tags_start"}
{php}
	include_once(mnminclude.'tags.php');
	global $main_smarty;
	
	$cloud=new TagCloud();
	$cloud->smarty_variable = $main_smarty; // pass smarty to the function so we can set some variables
	$cloud->word_limit = tags_words_limit_s;
	$cloud->min_points = tags_min_pts_s; // the size of the smallest tag
	$cloud->max_points = tags_max_pts_s; // the size of the largest tag
	
	$cloud->show();
	$main_smarty = $cloud->smarty_variable; // get the updated smarty back from the function
{/php}
		<div id="topTags" class="sidebarBlock">
			<h3 class="sidebarBlockHeader">{#PLIGG_Visual_Top_5_Tags#}</h3>
			<div class="sidebarBlockContent">
				{section name=customer loop=$tag_number}
					<a href="{$tag_url[customer]}">{$tag_name[customer]}</a>
				{/section}
			</div>
		</div>
{checkActionsTpl location="tpl_widget_tags_end"}
{/if}