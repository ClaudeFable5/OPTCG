-- AUTO-GENERATED: EB04-060 / 고무고무 호크 총난타
-- rules_id=EB04-060 script_id=880002481 fingerprint=3a2c35df1ec4e903799625f79c26ec1c1e9b0480d6cda3f91c841ce8418b0293
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-060]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            faceup=true,
            filter={
              card_type=[[CHARACTER]],
              trait=[[에그 헤드]],
            },
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_HAND]],
            player=[[YOU]],
          },
          {
            amount=-1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
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
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP_OR_BOTTOM]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 라이프 위나 아래에서 1장을 패에 넣을 수 있다: 자신의 패에서 《에그 헤드》 특징을 가진 캐릭터 카드 1장까지를 라이프 맨 위에 앞면으로 놓는다. 그 후, 상대의 캐릭터 1장까지는 이번 턴 동안 파워 -1000.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】카드를 2장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-060]],
    schema_version=1,
  })
end
