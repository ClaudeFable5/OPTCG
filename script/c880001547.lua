-- AUTO-GENERATED: OP12-094 / 몽키 D. 드래곤
-- rules_id=OP12-094 script_id=880001547 fingerprint=837948dbb01c78c5962118983ff37c1410aa8df211db802b1a5119eb9f8d4862
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-094]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=6,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[혁명군]],
          },
        },
        costs={
          {
            count=3,
            filter={
              trait=[[혁명군]],
            },
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 트래시에서 《혁명군》 특징을 가진 카드 3장을 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다: 자신의 리더가 《혁명군》 특징을 가진 경우, 자신의 트래시에서 코스트 6 이하인 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-094]],
    schema_version=1,
  })
end
