-- AUTO-GENERATED: EB01-042 / 스칼렛
-- rules_id=EB01-042 script_id=880000041 fingerprint=8cbcc1036ce0d93868cc97ace153e2bbf6362389de877387b6a1f8fcf7a3605b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-042]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=3,
              name_neq=[[스칼렛]],
              trait=[[드레스로자]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=true,
          },
          {
            amount=-2,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 자신의 패에서 「스칼렛」 이외의 코스트 3 이하인 《드레스로자》 특징을 가진 캐릭터 카드를 1장까지 레스트 상태로 등장시킨다. 그 후, 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -2.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-042]],
    schema_version=1,
  })
end
