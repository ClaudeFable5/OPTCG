-- AUTO-GENERATED: EB01-013 / 코즈키 히요리
-- rules_id=EB01-013 script_id=880000012 fingerprint=e09da6eeefeea3a5b083139c4ce40b3971308b8f01f61fc0b3adcc491ac5f7a9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-013]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=5,
              name_neq=[[코즈키 히요리]],
              trait=[[와노쿠니]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
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
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 자신의 패에서 「코즈키 히요리」 이외의 코스트 5 이하인 《와노쿠니》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다. 그 후, 카드를 1장 뽑는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-013]],
    schema_version=1,
  })
end
