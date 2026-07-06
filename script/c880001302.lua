-- AUTO-GENERATED: OP10-087 / 토니토니 쵸파
-- rules_id=OP10-087 script_id=880001302 fingerprint=a0a23a4e0413d45d06482cb6efd0e076371ae5a0358f97d490c3f468b5855331
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-087]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[OPPONENT]],
          },
          {
            count=2,
            op=[[MILL_DECK]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={
          {
            count=5,
            op=[[HAND_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={
          {
            op=[[REST_SELF]],
          },
          {
            count=1,
            filter={
              trait=[[드레스로자]],
            },
            kinds={
              [[LEADER]],
              [[STAGE]],
            },
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터와 자신의 《드레스로자》 특징을 가진 리더 또는 스테이지 1장을 레스트할 수 있다: 상대의 패가 5장 이상인 경우, 상대는 자신의 패 1장을 버린다. 그 후, 자신의 덱 위에서 2장을 트래시에 놓는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-087]],
    schema_version=1,
  })
end
