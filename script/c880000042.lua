-- AUTO-GENERATED: EB01-043 / 스팬다인
-- rules_id=EB01-043 script_id=880000042 fingerprint=639fb261a43f42a72091656a235f93e0c8fa8b3434f4bcfc3035db6363a64291
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-043]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              name_neq=[[스팬다인]],
              trait_contains=[[CP]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=true,
          },
        },
        conditions={},
        costs={
          {
            count=3,
            filter={
              trait_contains=[[CP]],
            },
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 트래시에서 『CP』를 포함한 특징을 가진 카드 3장을 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다: 자신의 트래시에서 「스팬다인」 이외의 코스트 4 이하인 『CP』를 포함한 특징을 가진 캐릭터 카드를 1장까지 레스트 상태로 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-043]],
    schema_version=1,
  })
end
