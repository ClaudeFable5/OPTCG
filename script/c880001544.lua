-- AUTO-GENERATED: OP12-091 / 포커
-- rules_id=OP12-091 script_id=880001544 fingerprint=03fbf56e02c8074b2b371256194c2bb29953e79458868b164ee2bf392df320ff
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-091]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=2,
              filter={
                trait=[[SMILE]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=3,
            filter={},
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 트래시에서 카드 3장을 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다: 이번 턴 동안, 자신의 《SMILE》 특징을 가진 캐릭터 2장까지의 파워 +2000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-091]],
    schema_version=1,
  })
end
